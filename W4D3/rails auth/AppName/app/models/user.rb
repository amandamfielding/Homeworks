class User < ActiveRecord::Base
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password,length: {minimum:6, allow_nil: true}

  def self.find_by_credentials(username,password)

  end

  def self.generate_session_token
  end

  def reset_session_token
  end

  before_filter :ensure_session_token
  def validate
  end
end
