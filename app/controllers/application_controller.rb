class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end
    
    before_action :require_login, :only=>[:new,:create,:edit,:destroy], :raise => false
    def require_login
        unless current_user
        redirect_to :controller => 'users'
        end
    end
end
