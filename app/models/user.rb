class User < ApplicationRecord
    before_save { self.email = email.downcase}
    has_many :articles, dependent: :destroy
    has_one_attached :ProfileImage
    validates :fullname, presence: true, length: {minimum:3, maximum:40}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:20}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}

    has_secure_password
end