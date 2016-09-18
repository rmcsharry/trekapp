class EmployeeSerializer < PersonSerializer
  attributes :status, :status_code
  
  has_many :assignments, foreign_key: "person_id"

  def status
    return object.status.dasherize
  end

  def status_code
    return Employee.statuses[object.status]
  end
end
