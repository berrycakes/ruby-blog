class CreateArticleAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :article_advertisements do |t|
      t.date :advertisement_date
      t.references :article, null: false, foreign_key: true
      t.references :advertisement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
