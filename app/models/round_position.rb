class RoundPosition < ActiveRecord::Base
  belongs_to :round
  has_one :driver
  attr_accessible :position, :total_time
end
