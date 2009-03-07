module BillsHelper
  def user_name(user)
    if user == current_user
      "you"
    else
      user.login
    end
  end
  
  def show_date(d)
    "<span class=\"date\">#{d.strftime("%b %d, %Y")}</span>"
  end
end
