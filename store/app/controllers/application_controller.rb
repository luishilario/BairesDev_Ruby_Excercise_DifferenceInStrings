class ApplicationController < ActionController::Base
    before_action :validate_user
    def validate_user
        puts "validating user"
    end
end
