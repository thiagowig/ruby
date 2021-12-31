class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :birthday

      t.timestamps
    end
  end
end
