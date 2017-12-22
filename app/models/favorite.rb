class Favorite < ActiveRecord::Base
  validates :effect_id, :presence => true
  validates :user_id,   :presence => true

  belongs_to :effect
  belongs_to :user
end
