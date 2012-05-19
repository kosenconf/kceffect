require "settingslogic"

class Settings < Settingslogic
  source Rails.root.join("config", ["settings", Rails.env, "yml"].compact.join(".")).to_s
end

if Settings.twitter.consumer_key == "dummy"
  Settings.twitter["consumer_key"] = ENV["TWITTER_CONSUMER_KEY"]
end

if Settings.twitter.consumer_secret == "dummy"
  Settings.twitter["consumer_secret"] = ENV["TWITTER_CONSUMER_SECRET"]
end
