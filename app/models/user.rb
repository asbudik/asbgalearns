class User < ActiveRecord::Base
  has_many :shoutouts
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true, :length => {:minimum => 6}, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = 4.hours.from_now
    self.save!
  end
end
