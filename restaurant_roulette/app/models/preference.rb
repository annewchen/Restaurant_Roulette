class Preference < ActiveRecord::Base
  belongs_to :voter, polymorphic: true
end
