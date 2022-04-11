class ArticleAdvertisement < ApplicationRecord
  belongs_to :article
  belongs_to :advertisement
end
