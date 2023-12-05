class PagesController < ApplicationController
  # Action to render the home page
  def home
    # Load random articles for the home page
    @articles = Article.order("RANDOM()").paginate(page: params[:page], per_page: 10)

    # Load trending articles based on views for the home page
    @trending_articles = Article.order(views: :desc).paginate(page: params[:page], per_page: 5)

    # Load the latest articles for the home page
    @latest_articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 5)

    # Load all categories for the home page
    @categories = Category.all
  end

  # Action to render the about page
  def about
    
  end
end


