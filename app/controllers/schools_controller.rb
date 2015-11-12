class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy, :programs, :program_edit]
	before_action :authenticate_school!, only: [:edit, :update, :destroy, :programs, :program_edit]
  layout :set_layout
  # GET /schools
  # GET /schools.json
  def index
    if params[:q]
      @schools = School.where("name ILIKE ?", "%#{params[:q]}%").limit(10)
    else
      @schools = School.all
    end  
    respond_to do |format|
      format.html
      format.json { render :json => @schools.map(&:attributes) }
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def programs
    
  end
  
  def program_edit
    @program = Program.new
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :description, :goals, :moto, :image_url, :address, :school_url, :telephone, :contact_mail, :statistics_text, :twitter_url, :facebook_url, :linkedin_url, :youtube_url, :tags_list, :categories_list)
    end
    
    def set_layout
      if administrator_signed_in?
        return 'administration'
      else
        return 'application'
      end
    end
end
