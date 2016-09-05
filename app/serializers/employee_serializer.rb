class EmployeeSerializer < PersonSerializer
  attributes :status, :status_code
  def status
    return object.status.dasherize
  end

  def status_code
    return Employee.statuses[object.status]
  end
end
