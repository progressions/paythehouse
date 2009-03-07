module BillsHelper
  def user_name(user)
    if user == current_user
      name = "you"
    else
      name = user.login
    end
    "<span class=\"user\">#{name}</span>"
  end
  
  def show_date(d)
    "<span class=\"date\">#{d.strftime("%b %d, %Y")}</span>"
  end
  
  def show_time(d)
    "<span class=\"time\">#{d.strftime("%I:%M%p")}</span>"
  end
  
  def time_created(entry)
    "<span class=\"time\">#{time_ago_in_words(entry.created_at)} ago</span>"
  end
  
  def amount(entry)
    "<span class=\"amount\">#{entry.amount}</span>"
  end
end
