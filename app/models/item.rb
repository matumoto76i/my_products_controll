class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :images, presence: true
  validates :name, presence: true, length: {maximum: 40}
  validates :quantity, presence: true

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
