class ChangePetBirthdayType < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :birthday, :date
  end
end
