class UserController < ApplicationController

  def number
    @number = {
      :online_member_count => Session.all.length
    }
    render json: @number
  end

end
