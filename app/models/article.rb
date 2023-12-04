class Article < ApplicationRecord 
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
    has_one_attached :thumbnail
    validates :title, presence: true, length: {minimum: 10, maximum: 120}
    validates :description, presence:true, length: {minimum: 20, maximum: 250}
    validates :content, presence:true
    attribute :views, :integer, default: 0
end