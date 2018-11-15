# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

validates :username, :session_token, presence: true, uniqueness: true
validates :password_digest, presence: true
validates :password, length: {in:8..20}, allow_nil: true

before_validation :ensure_session_token

attr_reader :password

def find_by_credentials(username, password)
  find_by(username: username, password: password)
end

def generate_session_token
  SecureRandom::urlsafe_base64
end

def reset_session_token!

  self.session_token=ensure_session_token
  self.save
end
def ensure_session_token
  self[:params[:session_token]] ||= generate_session_token
end

def set_password=(password)
  @password=password
self.password_digest =  BCrypt::Password.create(password)
end



end
