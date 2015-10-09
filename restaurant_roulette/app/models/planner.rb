class Planner < ActiveRecord::Base
  has_many :preferences, as: :voter

end





