class UserPaymentMethod < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  def country_name
    country = self.country
    ISO3166::Country[country]
  end
end
