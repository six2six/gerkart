class Round < ActiveRecord::Base
  attr_accessible :date, :name
  belongs_to :championship
  belongs_to :track
  has_many :roundPositions
  has_many :drivers, :through => :roundPositions
  accepts_nested_attributes_for :roundPositions

  def winner
    roundPositions.select {|v| v.position == 1 }.first
  end
end
