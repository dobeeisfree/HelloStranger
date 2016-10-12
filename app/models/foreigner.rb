class Foreigner < ActiveRecord::Base
  has_many :review,  through: :menus
end
