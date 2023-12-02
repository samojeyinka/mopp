class AddSocialMediaLinksToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :youtube_link, :string
    add_column :users, :instagram_link, :string
    add_column :users, :facebook_link, :string
    add_column :users, :twitter_link, :string
  end
end
