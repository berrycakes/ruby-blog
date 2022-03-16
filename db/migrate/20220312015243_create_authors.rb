class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :address
      t.date :date_verified

      t.timestamps
    end
  end
end
