class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
   
        @articles = @user.articles.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
    end

    def index
    @users = User.paginate(page: params[:page], per_page: 15)
    end


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            
            flash[:notice] = "Welcome to multib #{@user.username}"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
   
    end
    def update
       
        if @user.update(user_params)
        flash[:notice] = "Your account was updated successfully!"
        redirect_to articles_path
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account deleted successfully!"
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:fullname,:username, :email, :password,:ProfileImage)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own account"
            redirect_to @user
        end
    end
end


git filter-branch --env-filter '
OLD_EMAIL="cashbankincome@gmail.com"
CORRECT_NAME="samojeyinka"
CORRECT_EMAIL="samuelojeyinka@gmail.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL" 
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
