class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = 'Username or password was incorrect'
      redirect_to '/signin'
    end
  end


  def destroy
    session[:user_id] = nil

    redirect_to '/'
  end
end
