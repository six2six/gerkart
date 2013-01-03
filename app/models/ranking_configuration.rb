class RankingConfiguration < ActiveRecord::Base
  belongs_to :championship
  attr_accessible :points, :position

  def self.build_for championship
    Hash[where(:championship_id => championship.id).all.map{|item| [item.position, item.points]}]
  end
end
