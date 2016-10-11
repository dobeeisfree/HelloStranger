class Review < ActiveRecord::Base
    belongs_to :menus
    has_many   :foreigners
end
