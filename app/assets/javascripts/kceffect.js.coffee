@preview = (url, callback) ->
  maxThumbnailWidth      = 100
  defaultThumbnailMargin =  10
  charsLimit             = 300

  api = "http://api.embed.ly/1/oembed?key=#{embedlyApiKey}&url=#{escape(url)}&chars=#{charsLimit}&callback=?"
  $.getJSON api, (json) ->
    title = if json.title then json.title else json.url

    resizedWidth = 0
    if json.thumbnail_width
      if json.thumbnail_width < maxThumbnailWidth
        resizedWidth = json.thumbnail_width
      else
        resizedWidth = maxThumbnailWidth

    minHeight = 0
    if json.thumbnail_height
      resizedHeight = resizedWidth * json.thumbnail_height / json.thumbnail_width
      minHeight     = if resizedHeight > resizedWidth then resizedWidth else resizedHeight

    result =
      $("<div/>").addClass("preview").addClass(if json.thumbnail_url then "" else "no-thumbnail").css("min-height", minHeight)
      .append($("<div/>").addClass("thumb").width(resizedWidth)
              .append($("<a/>").attr({ href: (if json.url then json.url else url), title: title, target: "_blank" })
                      .append($("<img/>").attr({ src: json.thumbnail_url }).width(resizedWidth))))
      .append($("<div/>").addClass("text").css("margin-left", if resizedWidth == 0 then 0 else resizedWidth + defaultThumbnailMargin).css("min-height", resizedHeight)
              .append($("<div/>").addClass("title")
                      .append($("<a/>").attr({ href: url, title: title, target: "_blank" }).text(title)))
              .append($("<div/>").addClass("domain").text(json.provider_url))
              .append($("<div/>").addClass("description").text(json.description)))

    callback(result)

$(document).on "ajax:success", ".new_tagging", (event, data) ->
  form = $(data.form)
  tag  = $(data.tag).hide()
  $(this).replaceWith(form)
  tag.prependTo($(".tags")).fadeIn(1000)

$(document).on "ajax:success", ".link-to-delete-tagging", (event, data) ->
  $(this).fadeOut(1000)

$(document).on "ajax:success", ".link-to-favorite, .link-to-unfavorite", (event, data) ->
  $(".tooltip").hide()
  icons = $(this).parent().parent().children(".icons")
  html  = $(data.html)
  $(this).replaceWith(html)
  icons.prepend($(data.icon)) if data.icon

$(document).ready ->
  $.embedly.defaults["key"] = embedlyApiKey;

  $("body").tooltip {
    selector: ".user-cube, .tag-link, .link-to-effect, .link-to-edit, .link-to-favorite, .link-to-unfavorite"
  }
