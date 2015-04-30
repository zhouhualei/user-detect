class HomeController < ApplicationController

  def index
    if user_signed_in?
      @member_login_times = 0
      @member_login_time = 0
    else
      @guest_visit_time = 0
    end
    @online_member_count = 0
  end

end
