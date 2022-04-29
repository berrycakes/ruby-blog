module Payment
  class Client
    # sends payment intent to PayMongo, returns transaction intent id
    def self.payment_intent(amount)
      body = {
        "data": {
          "attributes": {
            "amount": amount, "payment_method_allowed": %w[card paymaya],
            "payment_method_options": {
              "card": { "request_three_d_secure": 'any' }
            },
            "description": 'Ruby Blog',
            "currency": 'PHP',
            "capture_type": 'automatic'
          }
        }
      }

      response = Request.call(http_method: 'post', endpoint: '/payment_intents', key: 'secret', body: body)
      { payment_intent_id: response.dig(:data, 'data', 'id') }
    end

    # sends customer payment method information to PayMongo, returns customer payment method id
    def self.payment_method(card, user)
      body = {
        "data": {
          "attributes": {
            "details": {
              "card_number": (card[:ccn]).to_s,
              "exp_month": card[:expm].to_i,
              "exp_year": card[:expy].to_i,
              "cvc": (card[:cvc]).to_s
            },
            "billing": {
              "address": {
                "line1": user.line1.to_s,
                "line2": user.line2.to_s,
                "city": user.city.to_s,
                "state": user.state.to_s,
                "postal_code": user.postal_code.to_s,
                "country": user.country.to_s
              },
              "name": user.name.to_s,
              "email": user.user.email.to_s,
              "phone": user.phone.to_s
            },
            "type": 'card'
          }
        }
      }

      response = Request.call(http_method: 'post', endpoint: '/payment_methods', key: 'public', body: body)
      { payment_method_id: response.dig(:data, 'data', 'id') }
    end

    # sends payment intent and payment method, return payment id and status "awaiting_next_action"
    def self.attach_payment_intent(card, user, amount)
      body = {
        "data": {
          "attributes": {
            "payment_method": (payment_method(card, user)[:payment_method_id]).to_s
          }
        }
      }
      response = Request.call(
        http_method: 'post',
        endpoint: "/payment_intents/#{payment_intent(amount)[:payment_intent_id]}/attach",
        key: 'secret',
        body: body
      )
      { attached_payment_id: response.dig(:data, 'data', 'id'),
        status: response.dig(:data, 'data', 'attributes', 'status') }
    end

    # get payment status and authorization url using attached payment intent id
    def self.get_payment_intent(intent_id = 'pi_PvWHLBow3CzWc7HsjxceykHQ')
      response = Request.call(http_method: 'get', endpoint: "/payment_intents/#{intent_id}", key: 'secret',
                              body: nil)
      status = response.dig(:data, 'data', 'attributes', 'status')
      updated_at = response.dig(:data, 'data', 'attributes', 'updated_at')
      redirect_url = response.dig(:data, 'data', 'attributes', 'next_action', 'redirect', 'url')
      { status: status, redirect: redirect_url, updated_at: updated_at }
    end
  end
end

# Payment::Client.payment_method
