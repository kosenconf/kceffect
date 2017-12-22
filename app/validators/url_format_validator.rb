class UrlFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value !~ /\A#{URI::regexp(%w(http https))}\z/
      record.errors[attribute] << (options[:message] || I18n.t('validators.format'))
    end
  end
end
