class UserController < ApplicationController

  def number
    @number = {
      :online_member_count => "hardcode_usernum"
    }
    respond_to do |format|
      format.json {render json: @number}
    end
  end

end
