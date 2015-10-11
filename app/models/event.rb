class Event < ActiveRecord::Base
  has_many :invitations
  has_many :preferences
  belongs_to :planner, :class_name => "User"
end
