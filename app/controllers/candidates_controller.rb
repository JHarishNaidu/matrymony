class CandidatesController < ApplicationController
  before_action :authorize, :except =>[:create_candidate,:new]
  def home
    if params[:search]
      @candidates = Candidate.search(params[:search]).order("created_at ASC").paginate(page: params[:page], per_page: 4)
    else
      @candidates = Candidate.all.paginate(page: params[:page], per_page: 4)
    end
  end

  def new
  	@candidate=Candidate.new
  end

  def edit
   	@candidate=Candidate.find(params[:id]) 	
  end

  def show
  	@candidate=Candidate.find(params[:id])
  end

  def list
  	@candidates=Candidate.all
  end

  def create_candidate
  	@candidate=Candidate.new(candidate_params)

  		if @candidate.save
        session[:candidate_id]= @candidate.id
  			redirect_to candidates_list_path
  		else
  			render 'new'
  		end
  end

  def update
  	@candidate=Candidate.find(params[:id])
  		if @candidate.update_attributes(candidate_params)
  			redirect_to candidates_list_path
  		else
  			render 'edit'
  		end
  end
  def image_list
    @images=Candidate.all.collect{|c| c.upload.url}  
  end


  private

  		def candidate_params
  			params.require(:candidate).permit(:email, :password, :password_confirmation, :name, :nick_name, :date_of_birth, :age, :sex, :family_members_count, :father, :mother, :brother, :sister, :upload)
  		end
end
