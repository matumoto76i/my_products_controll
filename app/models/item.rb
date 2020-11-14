class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :images, presence: true
  validates :name, presence: true, length: {maximum: 40}
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999}

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
