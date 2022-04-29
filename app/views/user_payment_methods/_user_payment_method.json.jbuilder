json.extract! user_payment_method, :id, :user_id, :name, :email, :phone, :line1, :line2, :city, :state, :postal_code, :country, :created_at, :updated_at
json.url user_payment_method_url(user_payment_method, format: :json)
