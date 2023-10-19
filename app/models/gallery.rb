class Gallery < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_many_attached :images
end
