class Trip < ActiveRecord::Base
  attr_accessible :name, :destination, :group_name 

  belongs_to :agency
  has_many :pictures, :as => :imageable
end
