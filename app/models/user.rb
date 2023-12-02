class User < ApplicationRecord
    before_save { self.email = email.downcase}
    before_save :add_https_to_links
    has_many :articles, dependent: :destroy
    has_one_attached :ProfileImage
    validates :fullname, presence: true, length: {minimum:3, maximum:40}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:20}
    validates :bio, length:{minimum: 3, maximum: 150}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}

    has_secure_password

    #social links
    def youtube_link?
        youtube_link.present?
      end

      def instagram_link?
        instagram_link.present?
      end
    
      def facebook_link?
        facebook_link.present?
      end
    
      def twitter_link?
        twitter_link.present?
      end

      private
      def add_https_to_links
        link_attributes = [:youtube_link, :instagram_link, :facebook_link, :twitter_link]
    
        link_attributes.each do |attribute|
          if self[attribute].present? && !self[attribute].start_with?('http://', 'https://')
            self[attribute] = "https://#{self[attribute]}"
          end
        end
      end
end