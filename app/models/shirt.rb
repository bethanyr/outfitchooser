class Shirt < ActiveRecord::Base
  attr_accessible :color, :name, :rating
  has_many :outfits
end
