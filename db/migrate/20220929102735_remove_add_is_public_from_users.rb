class RemoveAddIsPublicFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_public, :string
  end
end
