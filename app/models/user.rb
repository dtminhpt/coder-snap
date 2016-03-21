class User < ActiveRecord::Base
  has_secure_password 

  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :name, :email, :password, presence: true

  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :blocks
  has_many :blocked_users, through: :blocks
end
