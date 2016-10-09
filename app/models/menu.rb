class Menu < ActiveRecord::Base
  belongs_to  :store, foreign_key: 'store_id'
  has_many    :review
end
