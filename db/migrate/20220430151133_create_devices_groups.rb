class CreateDevicesGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :devices, :groups do |t|
      t.index :device_id
      t.index :group_id
    end
  
  end
end
