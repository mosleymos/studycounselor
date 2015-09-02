class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :edit, :update, :destroy, :profile]
  layout :set_layout
  # GET /counselors
  # GET /counselors.json
  def index
    if params[:q]
      @counselors = Counselor.where("counselors.first_name ILIKE ? OR counselors.last_name ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(10)
    else
      @counselors = Counselor.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselor_params
      params.require(:counselor).permit(:first_name, :last_name, :birthdate, :image_url, :email, :telephone, :address, :approved_by_administrator, :facebook_url,
      :twitter_url, :linkedin_url, :google_plus_url, :general_description, :school_description, :jobs_description, :availibility_description, :tags_list, :categories_list,
      :school_name, :moto, :study_domain, :high_school, :looking_job, :bac_mention, :study_level, :study_financing)
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
