class Championship < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :drivers
  has_many :rounds

  def build_ranking
    conf = RankingConfiguration.build_for(self)
    conf.default = 0
    ranking = Hash.new

    drivers.each do |driver|
        driverRank = {:points => 0, :rounds => []}
        rounds.each do |round|
            roundPosition = round.roundPositions.find(lambda { RoundPosition.new }) {|item| item[:round_id] == round.id and item[:driver_id] == driver.id}
            driverRank[:rounds] << {:position => roundPosition.position, :points => conf[roundPosition.position]}
            driverRank[:points] = driverRank[:points] + conf[roundPosition.position]
        end

        ranking[driver] = driverRank
    end

    Hash[ranking.sort_by {|driver, results| -results[:points]}]
  end
end
