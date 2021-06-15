class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?



    def post_like_text

        if @post_like_exists 
            "Unlike Post"
            else    
          "Like Post"
        end
    end

    
    
    helper_method :post_like_text

    
    
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
