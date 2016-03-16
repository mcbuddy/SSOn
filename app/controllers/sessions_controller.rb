class SessionsController < ApplicationController
  def create
      @user = User.from_om  niauth(request.env['omniauth.auth'])
    if @user
      session[:current_user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}"
    else
      flash[:warning] = 'Something wrong happen, please try again ...'
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:current_user_id)
      flash[:success] = 'You successfully logout!'
    end
    redirect_to root_path
  end
end