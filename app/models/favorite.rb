class Favorite < ActiveRecord::Base
  attr_accessible :effect_id, :user_id

  validates :effect_id, :presence => true
  validates :user_id,   :presence => true

  belongs_to :effect
  belongs_to :user
end
