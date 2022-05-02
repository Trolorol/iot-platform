class AddMessagingAddrToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :messaging_addr, :string
  end
end
