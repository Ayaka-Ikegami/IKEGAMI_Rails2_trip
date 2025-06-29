class User < ApplicationRecord

  has_many :reservations

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable

  validates :user_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, on: :create

  has_one_attached :avatar

  validates :user_name, length: { maximum: 15 }
  validates :profile, length: { maximum: 100 }

end
