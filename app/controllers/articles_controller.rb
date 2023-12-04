class  ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

def show
       # Increment the view count
       @article.increment!(:views)
end

def index
    # @articles = Article.all
   # @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @articles = Article.order(views: :desc).paginate(page: params[:page], per_page: 10)
  
end
    
def new
    @article =  Article.new
end

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

def edit
end

def update
    if @article.update(permit_fields)
    flash[:notice] = "Article updated successfully" 
    redirect_to @article
    else
        render 'edit'
    end
end

def destroy
    @article.destroy
    redirect_to articles_path
end

# define a method to make codes cleaner

def find_article
    @article = Article.find(params[:id])
end

def permit_fields
    params.require(:article).permit(:title, :description, :content, :thumbnail, category_ids:[])
end

def require_same_user
    if current_user != @article.user && !current_user.admin?
        flash[:alert] = "You can only edit or delete your own blog"
        redirect_to @article
    end
end

end
