class Assignment < ApplicationRecord
  belongs_to :employee
  belongs_to :trail
  
  # NOTE: if addding _ items, they need to be dasherized in the serializer
  enum status: [:unknown, :pending, :active]
end
