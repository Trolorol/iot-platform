class Scheduling < ApplicationRecord
  belongs_to :account
  belongs_to :device
  belongs_to :group
end
