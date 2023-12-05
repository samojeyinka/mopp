class UsersController < ApplicationController
    # Use a before action to set the user before specific actions
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    # Require user authentication for showing a user's profile
    before_action :require_user, only: [:show]
  
    # Require the same user or admin for editing, updating, and destroying a user account
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    # Action to display a user's profile and associated articles
    def show
      @articles = @user.articles.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
    end
  
    # Action to display a list of all users
    def index
      @users = User.paginate(page: params[:page], per_page: 15)
    end
  
    # Action to render the form for creating a new user
    def new
      @user = User.new
    end
  
    # Action to create a new user and log them in
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
  
        flash[:notice] = "Welcome to multib, #{@user.username}"
        redirect_to articles_path
      else
        render 'new'
      end
    end
  
    # Action to render the form for editing a user profile
    def edit
    end
  
    # Action to update an existing user profile
    def update
      if @user.update(user_params)
        flash[:notice] = "Your account was updated successfully!"
        redirect_to articles_path
      else
        render 'edit'
      end
    end
  
    # Action to destroy a user account
    def destroy
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account deleted successfully!"
      redirect_to root_path
    end
  
    private
  
    # Define the permitted parameters for user creation and updating
    def user_params
      params.require(:user).permit(:fullname, :username, :email, :password, :ProfileImage, :bio, :youtube_link, :instagram_link, :facebook_link, :twitter_link)
    end
  
    # Method to set the user based on the ID parameter
    def set_user
      @user = User.find(params[:id])
    end
  
    # Method to ensure that the current user is the same as the user being edited or an admin
    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own account"
        redirect_to @user
      end
    end
  end
  