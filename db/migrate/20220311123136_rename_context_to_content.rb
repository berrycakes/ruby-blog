class RenameContextToContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :context, :content
  end
end
