class Device < ApplicationRecord
    has_one :account, :class_name => "Account", :foreign_key => "id"
    has_many :devices_groups
    has_many :groups, through: :devices_groups
    has_one :trigger, :class_name => "Trigger", :foreign_key => "id"

    enum status: {
        desligado: 0,
        ligado: 1,
        sensor: 2
      }



    def trigger
        Trigger.find_by(id: self.trigger_id)
    end

end