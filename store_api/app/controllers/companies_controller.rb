class CompaniesController < ApplicationController
    def index
        @companies = Company.all
        render json: @companies
    end
    
    def show
        @company = Company.find(params[:id])
    end
        
    def create
        @company = Company.new(company_params)
        
        if @company.save
            render json: @company
        else
            render json: {error: "Could not create company"}
        end
    end
    
    def update
        @company = Company.find(params[:id])
        
        if @company.update(company_params)
            render json: @company
        else
            render json: {error: "Could not update company"}
        end
    end
    
    def destroy
        @company = Company.find(params[:id])
        @company.destroy
        
        @companies = Company.all
        render json: @companies
    end
    
    private
    def company_params
        params.require(:company).permit(:name)
    end
end
