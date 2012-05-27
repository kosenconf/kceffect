class Event < ActiveRecord::Base
  attr_accessible :address, :cover_url, :description, :end_at, :label, :name, :place, :start_at, :turnout, :url

  validates :label,    :presence => true, :uniqueness => true
  validates :name,     :presence => true
  validates :turnout,  :presence => true, :numericality => true
  validates :start_at, :presence => true
  validates :end_at,   :presence => true
  validates :url,      :url_format => true

  after_save :prepare_tag

  has_many :contributions
  has_many :users, :through => :contributions

  def to_param
    self.label
  end

  protected
  def prepare_tag
    tag = Tag.find_by_name(self.label)

    if tag.nil?
      Tag.create(:name => self.label, :category => "event")
    end
  end
end
