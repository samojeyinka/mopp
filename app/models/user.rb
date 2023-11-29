class User < ApplicationRecord
    has_many :articles

    validates :fullname, presence: true, length: {minimum:3, maximum:40}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:20}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}
end