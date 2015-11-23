class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :edit, :update, :destroy, :profile]
  layout :set_layout
  # GET /counselors
  # GET /counselors.json
	WillPaginate.per_page = 6
  def index
    if params[:q]
      @counselors = Counselor.where("counselors.first_name ILIKE ? OR counselors.last_name ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(10)
    else
      @counselors = Counselor.all.paginate(:page => params[:page], :per_page => 6)
    end  
   
  end

  # GET /counselors/1
  # GET /counselors/1.json
  def show
  end
  
  def profile
    
  end

  # GET /counselors/new
  def new
    @counselor = Counselor.new
  end

  # GET /counselors/1/edit
  def edit
  end

  # POST /counselors
  # POST /counselors.json
  def create
    @counselor = Counselor.new(counselor_params)
		if params[:counselor][:lundi]
		  @counselor.lundi = params[:counselor][:lundi].map{|dispo| dispo.to_i }
		end

		if params[:counselor][:mardi]
		  @counselor.mardi = params[:counselor][:mardi].map{|dispo| dispo.to_i }
		end

		if params[:counselor][:mercredi]
		  @counselor.mercredi = params[:counselor][:mercredi].map{|dispo| dispo.to_i }
		end

		if params[:counselor][:jeudi]
		  @counselor.jeudi = params[:counselor][:jeudi].map{|dispo| dispo.to_i }
		end
		
		if params[:counselor][:vendredi]
		  @counselor.vendredi = params[:counselor][:vendredi].map{|dispo| dispo.to_i }
		end

		if params[:counselor][:samedi]
		  @counselor.samedi = params[:counselor][:samedi].map{|dispo| dispo.to_i }
		end

		if params[:counselor][:dimanche]
		  @counselor.dimanche = params[:counselor][:dimanche].map{|dispo| dispo.to_i }
		end

    respond_to do |format|
      if @counselor.save
        format.html { redirect_to @counselor, notice: 'Counselor was successfully created.' }
        format.json { render :show, status: :created, location: @counselor }
      else
        format.html { render :new }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /counselors/1
  # PATCH/PUT /counselors/1.json
  def update

	 			 
    respond_to do |format|
      if @counselor.update(counselor_params)
				 # TODO: Corriger probleme des params avec les tableau
				 @counselor.lundi = params[:counselor][:lundi]
				 @counselor.mardi = params[:counselor][:mardi]
				 @counselor.mercredi = params[:counselor][:mercredi]
				 @counselor.jeudi = params[:counselor][:jeudi]
				 @counselor.vendredi = params[:counselor][:vendredi]
				 @counselor.samedi = params[:counselor][:samedi]
				 @counselor.dimanche = params[:counselor][:dimanche]
				 @counselor.save

        format.html { redirect_to @counselor, notice: 'Counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @counselor }
      else
        format.html { render :edit }
        format.json { render json: @counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /counselors/1
  # DELETE /counselors/1.json
  def destroy
    @counselor.destroy
    respond_to do |format|
      format.html { redirect_to counselors_url, notice: 'Counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def cards
    
  end
  
  def profile
    
  end
  
	# TODO: Action a refactorer ou supprimer
	def advisor_availability
		@counselor = current_counselor.id
		@coun = Counselor.find(@counselor)
		@counselor_availabilities = [@coun.lundi,@coun.mardi,@coun.mercredi,@coun.jeudi,@coun.vendredi,@coun.samedi, @coun.dimanche]
	end

	# TODO: Action a refactorer ou supprimer
	def register_advisor_availability

    @counselor = Counselor.find(current_counselor.id)
		@counselor.update(lundi: params[:lundi].to_s, mardi: params[:mardi].to_s, mercredi: params[:mercredi].to_s, jeudi: params[:jeudi].to_s, vendredi: params[:vendredi].to_s, samedi: params[:samedi].to_s, dimanche: params[:dimanche].to_s)

		redirect_to profile_counselor_path(current_counselor.id), notice:'Vos disponibilités ont été prise en compte'

	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselor_params
      params.require(:counselor).permit(:first_name, :last_name, :birthdate, :image_url, :email, :telephone, :address, :approved_by_administrator, :facebook_url, :twitter_url, :linkedin_url, :google_plus_url, :general_description, :bac_type,  :school_description, :jobs_description, :availibility_description, :tags_list, :categories_list, :school_name, :moto, :study_domain, :high_school, :looking_job, :bac_mention, :study_level, :study_financing, :lundi, :mardi, :mercredi, :jeudi, :vendredi, :samedi, :dimanche, :counselor_id, :etablissement) 
			params.permit(:mercredi => [])
    end
    
    def set_layout
      if administrator_signed_in?
        return 'administration'
      elsif counselor_signed_in?
        return 'administration'
      else
        return 'application'
      end
    end
end
