# -*- coding: utf-8 -*-
class Contribution < ActiveRecord::Base
  KINDS = [:attendee, :staff, :talker, :watcher, :dorar]

  validates :user_id,  :presence => true
  validates :event_id, :presence => true

  validate do
    if KINDS.all? { |kind| !self.send(kind) }
      KINDS.each do |kind|
        errors.add(kind, "どれかひとつはチェックしてください")
      end
    end
  end

  belongs_to :user
  belongs_to :event

  def self.kinds
    KINDS
  end
end
