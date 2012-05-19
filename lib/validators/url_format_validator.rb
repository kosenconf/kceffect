# -*- coding: utf-8 -*-

class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if value.present?
      if value !~ /^https?/
        object.errors[attribute] << "はhttpかhttpsではじまるものを入力してください。"
      end
    end
  end
end
