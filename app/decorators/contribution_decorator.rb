# -*- coding: utf-8 -*-

module ContributionDecorator
  def message
    tmp = []

    tmp << "参加" if attendee
    tmp << "運営" if staff
    tmp << "発表" if talker
    tmp << "視聴" if watcher
    tmp << "ドラ" if dorar

    "%s: %s" % [user.name, tmp.join(", ")]
  end
end
