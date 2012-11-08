class Championship < ActiveRecord::Base
  attr_accessible :name
  has_many :drivers
  has_many :rounds
end
