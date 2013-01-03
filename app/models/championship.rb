class Championship < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :drivers
  has_many :rounds

  def build_ranking
    conf = RankingConfiguration.build_for(self)
    conf.default = 0
    ranking = Hash.new
    rounds.each do |round|
        round.roundPositions.each do |roundPosition|
            driverRanking = ranking[roundPosition.driver]
            if driverRanking.nil?
                driverRanking = {:points => conf[roundPosition.position], :roundPositions => [roundPosition]}
                ranking[roundPosition.driver] = driverRanking
            else
                driverRanking[:points] = driverRanking[:points] + conf[roundPosition.position]
                driverRanking[:roundPositions] << roundPosition
            end
        end
    end

    Hash[ranking.sort_by {|driver, results| -results[:points]}]
  end
end
