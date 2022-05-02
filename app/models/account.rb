class Account < ApplicationRecord
  include Rodauth::Rails.model
  enum :status, unverified: 1, verified: 2, closed: 3
  has_many :devices, :class_name => "Device", :foreign_key => "account_id"
  has_many :groups, :class_name => "Group", :foreign_key => "account_id"
  has_one :profile
end
