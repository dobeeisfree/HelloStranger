class Review < ActiveRecord::Base
    belongs_to :store
    belongs_to :menu
    belongs_to :foreigner
end
