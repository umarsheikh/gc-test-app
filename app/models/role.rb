class Role < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :users

  class << self
    ["Agency Admin", "Agency User", "Account Owner", "Participant"].each do |role_name|
      define_method role_name.downcase.gsub(/ /, "_") do
        find_by_name(role_name)
      end
    end
  end
end
