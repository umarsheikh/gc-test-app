# encoding: utf-8

class ImageableUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [56,56]
  end

  # Image geometry
  before :cache, :capture_size_before_cache
  before :retrieve_from_cache, :capture_size_after_retrieve_from_cache

  def capture_size_before_cache(new_file)
    model.image_width, model.image_height = `identify -format "%wx%h" #{new_file.path}`.split(/x/)
  end

  def capture_size_after_retrieve_from_cache(cache_name)
    model.image_width, model.image_height = `identify -format "%wx%h" #{@file.path}`.split(/x/)
  end

  def dimensions
    "#{model.image_width}x#{model.image_height}"
  end

end
