class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :effect_id, :user_id

  validates :tag_id,    :presence => true
  validates :effect_id, :presence => true
  validates :user_id,   :presence => true

  belongs_to :tag
  belongs_to :effect
  belongs_to :user

  after_destroy { |record|
    tag = record.tag
    tag.destroy if !tag.event? && tag.taggings.count == 0
  }
end
