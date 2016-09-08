class Person < ApplicationRecord
  has_one :address, :as => :addressable
end
