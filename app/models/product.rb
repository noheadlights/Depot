class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :description, :image_url, :price, :title
  
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true
  validates :image_url, presence: true, format: {with: %r{\.(gif|jpg|png)\Z}i,
                                                 message: 'must be a URL for GIF,JPG or PNG.'}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}  
  private
    def ensure_note_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end                                             
end
