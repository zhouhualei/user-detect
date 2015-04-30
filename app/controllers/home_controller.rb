class HomeController < ApplicationController

  def index
    p "session: #{session}"
    if !session.nil? && !Session.find_by_session_id(session.id).nil?
      if user_signed_in?
        puts "current_user: #{current_user}"
        @member_login_times = current_user.login_times.to_i
        @member_online_minutes = (current_user.total_online_seconds.to_i + (Time.now - current_user.last_login_time)) / 60
      else
        p session.id
        guest_session = Session.find_by_session_id(session.id)
        @guest_visit_time = (Time.now - guest_session.created_at) / 60
      end
      @online_member_count = Session.of_members.collect{|x| x.user_id}.uniq.length
      @online_guest_count = Session.of_guests.length
    else
      # session of guest user should be stored at first
      redirect_to new_user_session_path
    end
  end

end
