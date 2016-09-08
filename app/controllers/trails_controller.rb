class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :update, :destroy]

  # GET /trails
  def index
    if params[:page]
      @trails = Trail.page(params[:page][:number]).per(params[:page][:size])
    else
      @trails = Trail.all
    end  
    @trails = Trail.all

    render json: @trails
  end

  # GET /trails/1
  def show
    render json: @trail
  end

  # POST /trails
  def create
    @trail = Trail.new(trail_params)

    if @trail.save
      render json: @trail, status: :created, location: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trails/1
  def update
    if @trail.update(trail_params)
      render json: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trails/1
  def destroy
    @trail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trail_params
      params.require(:trail).permit(:name, :description, :province, :country_code, :region_type, :agency, :website, :distance_value, :distance_unit, :distance_type)
    end
end
