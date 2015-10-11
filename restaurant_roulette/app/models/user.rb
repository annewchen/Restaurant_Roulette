class User < ActiveRecord::Base
  has_many :events, foreign_key: "planner_id"
  has_many :preferences, foreign_key: "participant_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
