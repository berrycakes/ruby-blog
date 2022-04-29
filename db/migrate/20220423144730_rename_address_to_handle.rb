class RenameAddressToHandle < ActiveRecord::Migration[6.1]
  def change
    rename_column :authors, :address, :handle
  end
end
