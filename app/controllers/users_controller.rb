class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def login
    @user = User.find_by(username: params[:username])
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :type)
    end

end
