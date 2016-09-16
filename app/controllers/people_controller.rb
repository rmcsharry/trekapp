class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    if params[:page]
      @people = Person.page(params[:page]).per(params[:per_page])
      pageCount = (Person.count / params[:per_page].to_f).ceil
    else
      @people = Person.all
      pageCount = 1
    end

    render json: @people, meta: { total: pageCount, records: Person.count}
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      if Rails.env.development?
        Rails.logger.info ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end    
      params.require(:employee).permit(:status, :first_name, :last_name, :email, :phone)
    end
end
