class CredentialsController < ApplicationController
  def destroy
    credential = current_user.credentials.find(params[:id])
    credential.destroy
    redirect_to user_url, notice: "Deleted credential"
  end
end
