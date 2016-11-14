class SessionsController < ApplicationController
  def new
  end
  def create
  	 authorised_candidate = Candidate.authenticate(params[:email],params[:password])
    if authorised_candidate
  		flash[:notice] = "Logged in Successfully"
  		session[:candidate_id]= authorised_candidate.id
  		redirect_to '/home'
  	else
  		flash[:log] = "Please enter correct credentials"
  		render action: :new
  	end
  end
  def destroy
  	session[:candidate_id] = nil
  	redirect_to action: :new
  end
end
