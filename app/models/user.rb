class User < ActiveRecord::Base
  has_secure_password 

  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :name, :email, :password, presence: true

  
end
