class  ArticlesController < ApplicationController

     # Used a before action to find the article before specific actions
    before_action :find_article, only: [:show, :edit, :update, :destroy]

    # Require user authentication for all actions except show and index
    before_action :require_user, except: [:show, :index]

      # Require the same user for editing, updating, and destroying an article
    before_action :require_same_user, only: [:edit, :update, :destroy]

     # Action to display a single article

    def show
       # Increment the view count
       @article.increment!(:views)
    end

      # Action to display a list of articles based on the numbers of viewers
    def index
    @articles = Article.order(views: :desc).paginate(page: params[:page], per_page: 10)
    end

     # Action to create a new article 
    def new
    @article =  Article.new
    end

    # Action to save a new article to the database
    def create 
    @article = Article.new(permit_fields)
    @article.user = current_user
    if @article.save
    flash[:notice] = "Article created successfully"
    redirect_to @article
    else
    render 'new'
    end
    end

      # Action to render the form for editing an article
    def edit
    end

    # Action to update an existing article in the database
    def update
    if @article.update(permit_fields)
    flash[:notice] = "Article updated successfully" 
    redirect_to @article
    else
        render 'edit'
    end
    end


     # Action to delete an article
    def destroy
    @article.destroy
    redirect_to articles_path
    end

# define a method to make codes cleaner

# Method to find the article based on the ID parameter
def find_article
    @article = Article.find(params[:id])
end

 # Method to define the permitted fields for article creation and updating
def permit_fields
    params.require(:article).permit(:title, :description, :content, :thumbnail, category_ids:[])
end

 # Method to ensure that the current user is the same as the article owner (or an admin)
def require_same_user
    if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own blog"
        redirect_to @article
    end
end

end
