module ApplicationHelper

  def start_user_login
    p "calling start_user_login, #{current_user}"
    if user_signed_in?
      # accumulate login times and set login time
      current_user.login_times = current_user.login_times.to_i + 1
      current_user.last_login_time = Time.now
      current_user.save
    end
  end

  def end_user_login
    if user_signed_in?
      current_user.total_online_seconds = current_user.total_online_seconds.to_i + (Time.now - current_user.last_login_time)
      current_user.save
    end
  end

end
