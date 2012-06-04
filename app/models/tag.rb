class Tag < ActiveRecord::Base
  attr_accessible :name, :category

  validates :name, :presence => true, :uniqueness => true

  has_many :taggings
  has_many :effects, :through => :taggings

  scope :event, where(:category => "event")

  def to_param
    self.name
  end

  def event?
    self.category == "event"
  end

  def event
    Event.find_by_label(self.name)
  end
end
