class Purchase < ApplicationRecord
  belongs_to :user

  attr_accessor :ccn, :expm, :expy, :cvc

  def get_authorization_url
    Payment::Client.get_payment_intent(payment_id)[:redirect]
  end

  def get_payment_status
    if !payment_id.nil?
      status = Payment::Client.get_payment_intent(payment_id)[:status]
      update(status: status)
      status
    else
      self.update(status: "invalid_payment_method")
      status
    end
  end

  def get_payment_status_date
    unless payment_id.nil?
      timestamp = Payment::Client.get_payment_intent(payment_id)[:updated_at]
      date = Time.at(timestamp).to_datetime
      date.strftime('Updated at %d %b %Y  %I:%M %p')
    end
  end

  def check_payment_method
    Payment::Client.get_payment_intent(payment_id)[:updated_at]
  end
end
