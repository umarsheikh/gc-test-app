class Logo < ActiveRecord::Base
  attr_accessible :agency_id, :current

  attr_accessor :image_width, :image_height

  belongs_to :agency

  mount_uploader :image, ImageUploader
end
