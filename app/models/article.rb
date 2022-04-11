class Article < ApplicationRecord
    has_many :comments
    has_many :article_advertisements
    has_many :articles, through: :article_advertisement
    validates :content, presence:true
    validates :title, presence:true, uniqueness: true
    before_save :set_default_comment
    # validate :check_length

    # # custom validate
    # def check_length
    #     if !self.content.nil? && self.content.length > 5
    #         errors.add(:content, "too long")
    #     end
    # end

    def set_default_comment
        self.comments.build(:body => "default comment")
    end

    def formatted_title
        self.title.upcase
    end
end
