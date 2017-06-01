class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def login
    @user = User.new
  end

  def loggingin
    @user = User.find_by(username: params[:user][:username])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]= @user.id
      redirect_to '/'
    else
      @errors = @user.errors.full_messages
      redirect_to '/users/login'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  private
    def user_params
      params[:user][:role] = params[:role]
      params.require(:user).permit(:username, :password, :role)
    end

end
