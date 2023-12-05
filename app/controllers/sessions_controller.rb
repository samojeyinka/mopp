class SessionsController < ApplicationController
  # Action to render the login form
  def new
  end

  # Action to authenticate user credentials and create a session
  def create
    # Find the user by email in a case-insensitive manner
    user = User.find_by(email: params[:session][:email].downcase)

    # Check if the user exists and the password is correct
    if user && user.authenticate(params[:session][:password])
      # Set the user id in the session to log in the user
      session[:user_id] = user.id

      flash[:notice] = "Logged in successfully"
      # Redirect to the user's profile page
      redirect_to user
    else
      flash.now[:alert] = "Wrong login credentials"
      # Re-render the login form with an error message
      render 'new'
    end
  end

  # Action to destroy the session and log the user out
  def destroy
    # Set the user id in the session to nil to log out the user
    session[:user_id] = nil

    flash[:notice] = "Logged out"
    # Redirect to the home page after logging out
    redirect_to root_path
  end
end
