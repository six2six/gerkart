class RoundPosition < ActiveRecord::Base
  belongs_to :round
  belongs_to :driver
  attr_accessible :position, :total_time
end
