class Review < ActiveRecord::Base
    belongs_to  :menu
   	belongs_to  :foreigner
end
