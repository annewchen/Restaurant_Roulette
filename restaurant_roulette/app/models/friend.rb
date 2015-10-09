class Friend < ActiveRecord::Base
  has_many :preferences, as: :voter
end
