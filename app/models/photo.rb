class Photo < ApplicationRecord
  mount_uploader :image_location, ImageLocationUploader

  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

end
