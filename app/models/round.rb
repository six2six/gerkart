class Round < ActiveRecord::Base
  attr_accessible :date, :name
  belongs_to :championship
  belongs_to :track
  has_many :roundPositions
  accepts_nested_attributes_for :roundPositions
end
