class ApplicationController < ActionController::API
    
    rescue_from ActiveRecord::RecordInvalid do |exception|
        errors({ params: exception.message }, :unprocessable_entity)
    end
    private
    def errors(errors, status)
        render json: { errors: errors }, status: status
    end
    
end
