class Event < ActiveRecord::Base
  attr_accessible :address, :cover_url, :description, :end_at, :label, :name, :place, :start_at, :turnout, :url

  validates :label,    :presence => true, :uniqueness => true
  validates :name,     :presence => true
  validates :turnout,  :presence => true, :numericality => true
  validates :start_at, :presence => true
  validates :end_at,   :presence => true
  validates :url,      :url_format => true

  has_many :contributions
  has_many :users, :through => :contributions

  def to_param
    self.label
  end
end
