class Employee < ApplicationRecord
  default_scope { order("status DESC, last_name ASC, first_name ASC") }

  # in reverse order of importance - ie higher integer in the db = higher importance
  enum status: [:unknown, :no_longer_employed, :standby, :active]
  #scope :current, -> { where(status: [Employee.statuses[:active], Employee.statuses[:standby]]) }

  has_one :address, as: :addressable

  has_many :assignments, dependent: :destroy
  has_many :trails, through: :assignments

  def capitalizable_attrs
    ["last_name", "first_name"]
  end
end
