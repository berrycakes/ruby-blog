class Article < ApplicationRecord
    validates :content, presence:true

    # validate :check_length

    # # custom validate
    # def check_length
    #     if !self.content.nil? && self.content.length > 5
    #         errors.add(:content, "too long")
    #     end
    # end

    def formatted_title
        self.title.upcase
    end
end
