class AddTriggerToDevices < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :trigger, null: false, foreign_key: true
  end
end
