class AddViewsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :views, :integer
  end
end
