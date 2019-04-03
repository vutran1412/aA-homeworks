# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: { minimum: 5, allow_nil: true }

    def self.find_by_credentials(username, password)
        user = User.find(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    private
    def ensure_session_token
        # must use ||= operator or else will end up with a new session token every
        # time we create an instance of the User class
        self.session_token ||= self.class.generate_session_token
    end


end