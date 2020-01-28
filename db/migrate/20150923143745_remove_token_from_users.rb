class RemoveTokenFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_token, :string
    remove_column :users, :encrypted_token_salt, :string
    remove_column :users, :encrypted_token_iv, :string
  end
end
