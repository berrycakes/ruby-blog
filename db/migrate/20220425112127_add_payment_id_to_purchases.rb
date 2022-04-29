class AddPaymentIdToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :payment_id, :string
  end
end
