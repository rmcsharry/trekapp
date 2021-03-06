class TrailsController < ApplicationController

  before_action :set_trail, only: [:show, :update, :destroy]

  # GET /trails
  def index
    if params[:page]
      @trails = Trail.page(params[:page]).per(params[:per_page])
      pageCount = (Trail.count / params[:per_page].to_f).ceil
    else
      @trails = Trail.all
      pageCount = 1
    end 

    render json: @trails, meta: { total: pageCount, records: Trail.count }
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
    if @trail.update(trail_params.except(:notes_count, :comments_count))
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
      if Rails.env.development?
        Rails.logger.info ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params)
    end

end
