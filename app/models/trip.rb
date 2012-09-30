class Trip < ActiveRecord::Base
  attr_accessible :name, :destination, :group_name 

  belongs_to :agency
end
