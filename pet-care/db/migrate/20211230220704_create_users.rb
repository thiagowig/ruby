class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
