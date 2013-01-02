class RankingConfiguration < ActiveRecord::Base
  belongs_to :championship
  attr_accessible :points, :position
end
