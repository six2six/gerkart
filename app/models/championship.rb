class Championship < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :drivers
  has_many :rounds
end
