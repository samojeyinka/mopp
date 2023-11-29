class  ArticlesController < ApplicationController
    
    before_action :find_article, only: [:show, :edit, :update, :destroy]

def show
end

def index
    @articles = Article.all
end
    
def new
    @article =  Article.new
end

def create 
  @article = Article.new(permit_fields)
  @article.user = User.second
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
    params.require(:article).permit(:title, :description, :content, :thumbnail)
end

end
