class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :author
  has_one :user_payment_method

  has_many :comments
  has_many :purchases
  has_many :gem_transfers

  def get_gem_balance
    purchase = self.purchases.where(:status => "succeeded").sum(:gem)
    spend = self.gem_transfers.sum(:gem)
    self.gem + purchase - spend
  end
end
