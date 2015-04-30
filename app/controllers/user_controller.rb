class UserController < ApplicationController

  def number
    @number = {
      :online_member_count => Session.of_members.length,
      :online_guest_count => Session.of_guests.length
    }
    render json: @number
  end

end
