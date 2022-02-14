class ChangeActiveStorageColumnType < ActiveRecord::Migration[7.0]
  def change

    change_column :active_storage_attachments, :record_id, :string

    change_column :active_storage_variant_records, :id, :string

  end
end
