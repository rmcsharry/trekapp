class EmployeeSerializer < ActiveModel::Serializer
  
  attributes  :id, 
              :avatar_url, 
              :first_name,
              :last_name, 
              :email,
              :phone,
              :status,
              :status_code,
              :active_count,
              :pending_count

  has_one :address  
  has_many :assignments
  has_many :trails, through: :assignments

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
