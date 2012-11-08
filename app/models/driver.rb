class Driver < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :championships
end
