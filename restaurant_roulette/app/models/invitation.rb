class Invitation < ActiveRecord::Base
  belongs_to :event

  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :phone_number, :full_name, presence: :true
end
