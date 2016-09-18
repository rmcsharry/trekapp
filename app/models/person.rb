class Person < ApplicationRecord
  has_one :address, :as => :addressable

  has_many :assignments, dependent: :destroy
  has_many :trails, through: :assignments

  def capitalizable_attrs
    ["last_name", "first_name"]
  end 
end
