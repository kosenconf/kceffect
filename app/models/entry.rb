class Entry < ActiveRecord::Base
  attr_accessible :comment, :url

  belongs_to :user

  validates :user_id, :presence => true
  validates :url,     :presence => true, :url_format => true
  validates :comment, :length => { :maximum => 200 }
end
