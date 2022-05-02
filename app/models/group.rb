class Group < ApplicationRecord
  has_many :devices_groups
  has_many :devices, through: :devices_groups, dependent: :destroy
  belongs_to :account
end
