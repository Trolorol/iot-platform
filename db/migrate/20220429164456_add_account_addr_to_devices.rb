class AddAccountAddrToDevices < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :account, null: false, foreign_key: true
  end
end
