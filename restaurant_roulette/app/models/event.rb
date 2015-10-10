class Event < ActiveRecord::Base
  has_many :invitations
  has_many :preferences
  belongs_to :planner, class_name: :user, foreign_key: :planner_id
end
