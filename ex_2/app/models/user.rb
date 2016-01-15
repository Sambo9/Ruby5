class User < ActiveRecord::Base
  has_secure_password


  validates :username, length: {in: 2..15}
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {in: 2..25}, confirmation: true
  validates_confirmation_of :password_confirmation, :message => " password should match confirmation"
end
