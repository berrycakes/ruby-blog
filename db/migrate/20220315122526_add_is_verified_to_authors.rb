class AddIsVerifiedToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :is_verified, :boolean
  end
end
