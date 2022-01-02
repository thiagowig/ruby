class AddUserIdToPet < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :user_id, :string
  end
end
