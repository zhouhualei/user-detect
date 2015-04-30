class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super

    if user_signed_in?
      p "add some logic here when user sign in successfully"
      p current_user
      # accumulate login times
      login_times = current_user.login_times.nil?? 0 : current_user.login_times
      current_user.login_times = login_times + 1

      # set login time
      current_user.last_login_time = Time.now

      current_user.save
      p "finished some logic when user sign in successfully"      
    end
  end

  # DELETE /resource/sign_out
  def destroy
    # accumulate login time
    unless user_signed_in?
      total_online_seconds = current_user.total_online_seconds.nil?? 0 : current_user.total_online_seconds
      current_user.total_online_seconds += total_online_seconds + (Time.now - current_user.last_login_time)
      current_user.save
    end
    super
    p "add some logic here when user sign in successfully"
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
