class AddGemToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gem, :integer, :default => 5
  end
end
