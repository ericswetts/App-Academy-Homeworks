module ApplicationHelper

  def auth_token
    <input type="hidden"
    name='authenticity_token'
    value= h('{form_authrnticity_token}')>
  end
end
