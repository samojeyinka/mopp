    class PagesController < ApplicationController
        def home
           # @articles = Article.all.order(created_at: :desc)
           #Display articles randomly
           @articles = Article.all.order("RANDOM()")


        end
        
        def about

        end
        
end

