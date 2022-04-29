class CreateFollowedAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :followed_authors do |t|
      t.integer :user_id
      t.integer :author_id

      t.timestamps
    end
  end
end
