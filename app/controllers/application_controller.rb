class ApplicationController < ActionController::Base

    #Define helper methods accessible in views
    helper_method :current_user, :logged_in?

    #Returns the currently logged-in user or nil if none
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
     end

    # Checks if a user is logged in
     def logged_in?
        !!current_user
    end

    # Redirects to login page if user is not logged in
    def require_user
        if !logged_in?
            flash[:alert] = "Please sign in to perform this action"
            redirect_to login_path
        end
    end
end
