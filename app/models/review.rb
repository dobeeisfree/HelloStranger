class Review < ActiveRecord::Base
    belongs_to :store, foreign_key: 'store_name', 'store_location'
    belongs_to :menu, foreign_key: 'menu_name', 'menu_picture', 'menu_id'
    belongs_to :foreigner, foreign_key: 'foreigner_id'
end
