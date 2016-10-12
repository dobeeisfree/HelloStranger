class Review < ActiveRecord::Base
    belongs_to 	:menus
   	belongs_to  :foreigners
end
