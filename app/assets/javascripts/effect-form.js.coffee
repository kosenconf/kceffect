tagsTextField = $("#effect_tags")

$(".tag-selector").click ->
  selected = $.trim($(this).text())
  current = tagsTextField.val().split(/\s/)

  if !(_.include(current, selected))
    tagsTextField.val(current.concat(selected).join(" "))
  else
    tagsTextField.val(_.reject(current, (element) ->
      return element == selected
    ).join(" "))
