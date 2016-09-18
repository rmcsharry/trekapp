class Person < ApplicationRecord
  has_one :address, :as => :addressable

  has_many :assignments
  has_many :trails, through: :assignments
end
