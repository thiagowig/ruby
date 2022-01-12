class CreateFactorValidations < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :factor_validations, id: :uuid, default: 'gen_random_uuid()'  do |t|
      t.integer :status, default: 2
      t.timestamp :ttl
      t.string :user_id

      t.timestamps
    end
  end
end
