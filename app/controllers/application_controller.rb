class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def experimentor?(proposal)
    current_user == proposal.experimentor
  end

  helper_method :current_user
  helper_method :logged_in?
  helper_method :experimentor?

end
