module Admin::UsersHelper

  # Render a paginated table of users or a humane message
  # if the table is empty
  def users_list(users)
    if users.empty?
      content_tag :p do
        "No users."
      end
    else
      render :partial => 'table', :locals => {:users => users}
    end
  end
  
end
