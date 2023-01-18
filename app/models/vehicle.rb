class Vehicle < ApplicationRecord
  include Drivable
  has_one :engine
  has_many :wheels
end
