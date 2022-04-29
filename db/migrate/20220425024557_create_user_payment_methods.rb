class CreateUserPaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :user_payment_methods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country

      t.timestamps
    end
  end
end
