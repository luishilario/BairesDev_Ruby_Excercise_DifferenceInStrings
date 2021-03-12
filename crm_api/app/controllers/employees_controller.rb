class EmployeesController < ApplicationController
    def index
        @employees = Employee.page params[:page] if params[:page]
        @employees = Employee.all.except(:limit, :offset) unless params[:page]
        render status: :ok
    end
    
    def show
        @employee = Employee.find(params[:id])
        render status: :ok
    end
      
    def create
        @employee = Employee.create!(employee_params)
        render json: @employee, status: :created
    end
    
    def update
        @employee = Employee.find(params[:id])
        
        if @employee.update(employee_params)
            render json: @employee
        else
            render json: {error: "Could not update employee"}
        end
    end
    
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        
        @employees = Employee.all
        render json: @employees
    end

    private
    def employee_params
        params.require(:employee).permit(:name, :birthdate, :project, :country, :role)
    end
end
