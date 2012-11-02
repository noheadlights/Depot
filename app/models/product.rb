class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, presence: true, length: {minimum: 10}
  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true, format: {with: %r{\.(gif|jpg|png)\Z}i,
                                                 message: 'must be a URL for GIF,JPG or PNG.'}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}                                               
end
