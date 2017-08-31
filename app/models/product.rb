class Product < ApplicationRecord


  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :quantity, presence: true 
end
