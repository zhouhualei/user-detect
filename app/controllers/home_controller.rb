class HomeController < ApplicationController

  def index
    if user_signed_in?
      puts "current_user: #{current_user}"
      @member_login_times = current_user.login_times

      total_online_seconds = current_user.total_online_seconds.nil?? 0 : current_user.total_online_seconds
      @member_online_minutes = (total_online_seconds + (Time.now - current_user.last_login_time)) / 60
    else
      puts "session: #{session.id}"
      guest_session = Session.find_by_session_id(session.id)
      @guest_visit_time = (Time.now - guest_session.created_at) / 60
    end
    @online_member_count = Session.of_members.length
    @online_guest_count = Session.of_guests.length
  end

end
