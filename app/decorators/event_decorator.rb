# -*- coding: utf-8 -*-

module EventDecorator
  def date
    start_at_string = start_at.to_s(:ymd)
    end_at_string   = end_at.to_s(:ymd)

    if start_at_string == end_at_string
      start_at_string
    else
      "#{start_at_string} 〜 #{end_at_string}"
    end
  end

  def place_and_address
    "#{place} (#{address})"
  end

  def cover_tag(options = {})
    path = cover_url.present? ? cover_url : "white.png"
    image_tag(path, options)
  end
end
