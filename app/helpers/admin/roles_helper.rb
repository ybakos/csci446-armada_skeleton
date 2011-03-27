module Admin::RolesHelper

  # Render a paginated table of roles or a humane message
  # if the table is empty
  def roles_list(roles)
    if roles.empty?
      content_tag :p do
        "No roles."
      end
    else
      render :partial => 'table', :locals => {:roles => roles}
    end
  end

end
