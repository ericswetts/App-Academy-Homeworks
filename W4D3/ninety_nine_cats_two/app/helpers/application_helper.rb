module ApplicationHelper
  def auth_token
    html = "<input type=hidden'"
    html += "name='authenticity_token'"
    html += "value='#{form_authenticity_token}'>"
    html.h

  end
end
