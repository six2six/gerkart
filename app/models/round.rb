class Round < ActiveRecord::Base
  attr_accessible :date, :name
  belongs_to :championship
  has_one :track
  has_many :roundPositions, :as => :standings
end
