# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

validates :user_name, :password_digest, :session_token, presence: :true
# validates :password_digest, presence: {message: "Password can't be blank"}
after_initialize :ensure_session_token
validates :password, length: {minimum: 6, allow_nil: true}  
validates :user_name, :password_digest, uniqueness:true

attr_reader :password

def ensure_session_token
    self.session_token ||= User.generate_session_token 
end

def self.find_by_credentials(user_name, password)

    user = User.find_by(user_name: user_name)
    # debugger
    return nil if user.nil?
    user.check_password?(password) ? user : nil
end

def self.generate_session_token
    SecureRandom::urlsafe_base64
end

def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
end

def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
end

def check_password?(password)
password_obj = BCrypt::Password.new(self.password_digest)
password_obj.is_password?(password)
end


end
