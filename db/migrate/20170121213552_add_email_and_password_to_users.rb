class AddEmailAndPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email, :string, null: false
    add_column :users, :password_digest, :string, null: false
  end
end
