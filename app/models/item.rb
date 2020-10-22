class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :image
end
