class AddStateToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :status, :integer
  end
end
