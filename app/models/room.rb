class Room < ApplicationRecord

  has_many :reservations, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :introduction
    validates :address
    validates :charge
  end

  validates :name, length: { maximum: 17 }
  validates :introduction, length: { maximum: 150 }
  validates :address, length: { maximum: 50 }
  validates :charge, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  has_one_attached :image

end