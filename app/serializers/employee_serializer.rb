class EmployeeSerializer < ActiveModel::Serializer
  
  attributes  :id, 
              :avatar_url, 
              :first_name,
              :last_name, 
              :email,
              :phone,
              :status,
              :active_count,
              :pending_count

  has_one :address  
  has_many :assignments
  has_many :trails, through: :assignments

  def active_count
    object.assignments.active.count
  end

  def pending_count
    object.assignments.pending.count
  end  
end
