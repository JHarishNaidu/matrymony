class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_candidate
    @current_candidate ||= Candidate.find(session[:candidate_id]) if session[:candidate_id]
  end
  helper_method :current_candidate

  def authorize
    redirect_to '/' unless current_candidate
  end
end
