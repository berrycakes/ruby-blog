class CreateGemTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :gem_transfers do |t|
      t.integer :gem
      t.references :author, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
