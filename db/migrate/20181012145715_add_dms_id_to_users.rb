class AddDmsIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dms_id, :string, null: false, default: ""
  end
end
