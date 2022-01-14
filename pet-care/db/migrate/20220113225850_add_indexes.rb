class AddIndexes < ActiveRecord::Migration[7.0]
  def change

    add_index :users, :email, unique: true
    add_index :pets, :user_id

  end
end
