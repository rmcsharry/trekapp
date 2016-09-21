class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /employees
  def index
    if params[:page]
      @employees = Employee.page(params[:page]).per(params[:per_page])
      pageCount = (Employee.count / params[:per_page].to_f).ceil
      render json: @employees, meta: { total: pageCount, records: Employee.count}
    else
      Rails.logger.info("params here: #{params.to_json}")
      filter = params[:data][:filter] if !params[:data].nil? && !params[:data][:filter].nil?
      
      if !filter.nil? && !filter[:status].nil?
        @employees = Employee.where('status in (?)', filter[:status])
        render json: @employees, each_serializer: CurrentEmployeesSerializer
      else
        @employees = Employee.all
        render json: @employees
      end
      
    end
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      if Rails.env.development?
        Rails.logger.info "Params are:#{params.to_json}" 
        Rails.logger.info ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params)
    end
end
