class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:dashboard]
  # before_action :authenticate_representative!, only: [:dashboard]

  def dashboard
    @schools = School.where(representative_id: current_representative.id) 
  end

  private

  def set_representative
    Representative.find(params[:id])
  rescue
    redirect_to 'server_error'
  end

  def representative_params
    params.permit!
  end
end
