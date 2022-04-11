class Advertisement < ApplicationRecord
    has_many :article_advertisements
    has_many :articles, through: :article_advertisement
end
