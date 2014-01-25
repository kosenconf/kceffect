condition = "icon_url LIKE '%twimg%' AND icon_url NOT LIKE '%pbs%'"

User.where(condition).order(:id).each do |user|
  puts "(id:%d) @%s" % [user.id, user.name]

  url = user.icon_url

  begin
    open(url)
  rescue => error1
    if error1.class == OpenURI::HTTPError
      begin
        new_url = Twitter.user(user.twitter_id.to_i).profile_image_url
        new_url_replaced = new_url.sub(/_normal(\.[^.]+)$/) { |e| $1 }

        puts "\t#{url}\n\t=> #{new_url_replaced}"

        open(new_url_replaced)

        user.update_attribute(:icon_url, new_url_replaced)
      rescue => error2
        p error2
      end
    end
  else
    p error1
  end

  sleep 10
end
