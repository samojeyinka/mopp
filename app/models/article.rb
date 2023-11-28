class Article < ApplicationRecord 
    has_one_attached :thumbnail
    validates :title, presence: true, length: {minimum: 10, maximum: 100}
    validates :description, presence:true, length: {minimum: 20, maximum: 250}
    validates :content, presence:true
end