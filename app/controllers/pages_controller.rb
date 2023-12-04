    class PagesController < ApplicationController
        # def home
        #    @articles = Article.order("RANDOM()").paginate(page: params[:page], per_page: 10)
        #    @trending_articles = Article.order(views: :desc).paginate(page: params[:page], per_page: 5)
        #    @latest_articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 5)

        #     # category controller
        #     @categories = Category.all
        # end

        def home
            @articles = Article.order("RANDOM()").paginate(page: params[:page], per_page: 10)
            @trending_articles = Article.order(views: :desc).paginate(page: params[:page], per_page: 5)
            @latest_articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
          
            # Load categories for the home page
            @categories = Category.all
          end
          
        
        def about

        end
        
end

