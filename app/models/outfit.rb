class Outfit < ActiveRecord::Base
  attr_accessible :dateworn, :dayworn, :shirt_id, :user_id
  belongs_to :user
  belongs_to :shirt
end
