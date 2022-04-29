class Author < ApplicationRecord
    belongs_to :user
    has_many :articles
    validates :name, uniqueness:true, presence:true
    # validates :address, presence:true
    # validates :date_verified, presence:true
    validate :check_date

    def check_date
        if !self.date_verified.nil? && self.date_verified > Date.today
            errors.add(:date_verified, "should not be later than today")
        end
    end
end
