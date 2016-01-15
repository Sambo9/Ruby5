class User < ActiveRecord::Base

  validates :username, length: {in: 2..15}
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password_digest, length: {in: 2..25}, confirmation: true
end
