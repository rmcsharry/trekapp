class Employee < Person
  default_scope { order("status DESC, last_name ASC") }

  # in reverse order of importance - ie higher integer in the db = higher importance
  enum status: [:unknown, :no_longer_employed, :standby, :active]
  #scope :current, -> { where(status: [Employee.statuses[:active], Employee.statuses[:standby]]) }

end
