class Item < ActiveRecord::Base
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  belongs_to :category

  after_initialize { p "initialized" }
  after_save       { p "saved" }
  after_create     { p "created"; } # ItemMailer.new_item_created(self).deliver # category.inc(:items_count, 1) }
  after_update     { p "updated" }
  after_destroy    { p "destroyed" } # category.inc(:items_count, -1) }
end
