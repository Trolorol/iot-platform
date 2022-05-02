class CreateSchedulings < ActiveRecord::Migration[7.0]
  def change
    create_table :schedulings do |t|
      t.references :account, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.datetime :schedule_time

      t.timestamps
    end
  end
end
