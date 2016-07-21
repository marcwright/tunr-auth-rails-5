class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :artists
  has_secure_password
end
