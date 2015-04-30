class UserController < ApplicationController

  def number
    @number = {
      :online_member_count => "hardcode_usernum"
    }
    render json: @number
  end

end
