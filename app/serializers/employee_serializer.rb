class EmployeeSerializer < PersonSerializer
  attributes :status, :status_code, :active_count, :pending_count
  
  has_many :assignments, foreign_key: "person_id"

  def status
    return object.status.dasherize
  end

  def status_code
    return Employee.statuses[object.status]
  end

  def active_count
    object.assignments.active.count
  end

  def pending_count
    object.assignments.pending.count
  end  
end
