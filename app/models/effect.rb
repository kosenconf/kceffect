class Effect < ActiveRecord::Base
  attr_accessible :comment, :url, :effected_at

  belongs_to :user

  validates :user_id,     :presence => true
  validates :url,         :presence => true, :url_format => true
  validates :comment,     :length => { :maximum => 200 }
  validates :effected_at, :presence => true
end
