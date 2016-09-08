class Employee < Person
  # in reverse order of importance - ie higher integer in the db = higher importance
  enum status: [:unknown, :no_longer_employed, :standby, :active]
end
