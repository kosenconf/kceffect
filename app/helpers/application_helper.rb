module ApplicationHelper
  def user_icon(user, size)
    image_tag(user.icon_url, :size => "#{size}x#{size}")
  end
end
