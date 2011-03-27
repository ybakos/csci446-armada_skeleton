module ApplicationHelper

  def admin_menu_items(user)
    render :partial => 'layouts/admin_menu_items' if user.is_admin?
  end

  def menubar(user)
    render :partial => 'layouts/menubar' if user
  end
  
  def userbar(user)
    if user
      render :partial => 'layouts/userbar'
    else
      render :partial => 'layouts/loginbar'
    end
  end
  
  def google_webfont_stylesheet(face)
    "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://fonts.googleapis.com/css?family=#{face}\" />"
  end
  
end
