class User < ActiveRecord::Base
  attr_accessible :profile

  validates :name, :presence => true, :uniqueness => true, :format => { :with => /\A[A-Za-z0-9_]+\z/ }, :length => { :in => 2..50 }
  validates :icon_url,      :presence => true
  validates :twitter_id,    :presence => true
  validates :access_token,  :presence => true
  validates :access_secret, :presence => true

  has_many :effects
  has_many :contributions
  has_many :events, :through => :contributions
  has_many :taggings

  def to_param
    self.name
  end
end
