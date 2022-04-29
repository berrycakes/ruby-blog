class Article < ApplicationRecord
  has_rich_text :content
  has_many :comments
  has_many :gem_transfers
  has_one :author

  # has_many :article_advertisements
  # has_many :articles, through: :article_advertisement
  validates :content, presence: true
  validates :title, presence: true, uniqueness: true
  # before_save :set_default_comment
  # validate :check_length

  # # custom validate
  # def check_length
  #     if !self.content.nil? && self.content.length > 5
  #         errors.add(:content, "too long")
  #     end
  # end

  def set_default_comment
    comments.build(body: 'default comment')
  end

  def formatted_title
    title.upcase
  end

  def total_gem_transfers
    gem_transfers.sum(:gem)
  end

  def user_gem_transfers(user)
    if user
      gem_transfers.where(user_id: user.id).sum(:gem)
    else
      0
    end
  end

  def article_owner(current_user)
    author = Author.find(author_id).user_id
    if current_user
      user = current_user.id
      author == user
    else
      false
    end
  end

  def get_author
    Author.find(author_id)
  end

  def get_article_date
    timestamp = updated_at
    date = Time.at(timestamp).to_datetime
    date.strftime('%d %b %Y  %I:%M %p')
  end
end
