class Employee < Person
  default_scope { order("status DESC, last_name ASC") }
  
  has_many :assignments, foreign_key: "person_id"
  has_many :trails, through: :assignments

  # in reverse order of importance - ie higher integer in the db = higher importance
  enum status: [:unknown, :no_longer_employed, :standby, :active]
  #cope :current, -> { where(status: [Employee.statuses[:active], Employee.statuses[:standby]]) }

end
