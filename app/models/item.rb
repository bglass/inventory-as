class Item < ApplicationRecord

  belongs_to :parent, class_name: "Item"
  has_many :children, class_name: "Item", foreign_key: "parent_id"

  has_many_attached :images
  # Note that implicit association has a plural form in this case
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
end
