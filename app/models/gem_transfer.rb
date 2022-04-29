class GemTransfer < ApplicationRecord
  belongs_to :author
  belongs_to :article
  belongs_to :user

  before_create :sufficient_gem_balance
  before_save :transfer_gems

  def sufficient_gem_balance
    user.get_gem_balance.positive?
  end

  def transfer_gems
    if user.get_gem_balance.positive?
      if !author.received_gem.nil?
        author.received_gem += gem
      else
        author.received_gem = gem
      end
      author.save
    else
      false
    end
  end
end
