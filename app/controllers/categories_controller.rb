class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update,:show, :destroy]
    # Require admin privileges for all actions except index and show
    before_action :require_admin, except: [:index, :show]
  
    # Action to render the form for creating a new category
    def new
      @category = Category.new
    end
  
    # Action to save a new category to the database
    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Category created successfully"
        redirect_to @category
      else
        render 'new'
      end
    end
  
    # Action to render the form for editing a category
    def edit
    
    end
  
    # Action to update an existing category in the database
    def update
      if @category.update(category_params)
        flash[:notice] = "Category name updated successfully"
        redirect_to @category
      else
        render 'edit'
      end
    end
  
    # Action to display a list of all categories
    def index
      @categories = Category.all
    end
  
    # Action to display a specific category and its associated articles
    def show
      @categories = Category.all
      @articles = @category.articles.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
    end

    def destroy
      @category.destroy
      redirect_to categories_path
    end
  
    private

    def find_category
      @category = Category.find(params[:id])
    end
  
    # Define the permitted parameters for category creation and updating
    def category_params
      params.require(:category).permit(:name)
    end
  
    # Method to check if the current user is an admin
    def require_admin
      unless logged_in? && current_user.admin?
        flash[:alert] = "Only admin can perform this action"
        redirect_to categories_path
      end
    end
  end
  