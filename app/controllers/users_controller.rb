class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: "You have logged out"
  end

  def callback
    unless auth_data
      redirect_to root_url, notice: "Invalid login attempt"
      return
    end

    credential = Credential.from_auth_data(auth_data)

    unless current_user
      user = User.where(auth_key: credential.auth_key).first_or_create
      session[:current_user_id] = user.id
    end

    current_user.add_credential(credential)

    redirect_to user_url, notice: "You have been logged in"
  end

  private def auth_data
    request.env['omniauth.auth']
  end
end
