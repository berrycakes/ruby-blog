class AddReceivedGemToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :received_gem, :integer
  end
end
