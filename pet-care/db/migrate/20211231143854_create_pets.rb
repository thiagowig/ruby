class CreatePets < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :pets, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.datetime :birthday

      t.timestamps
    end
  end
end
