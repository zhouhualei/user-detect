class UserController < ApplicationController

  def number
    @number = {
      :online_member_count => Session.of_members.collect{|x| x.user_id}.uniq.length,
      :online_guest_count => Session.of_guests.length
    }
    render json: @number
  end

end
