class Store < ActiveRecord::Base
  has_many    :menu, foreign_key: 'menu_id'
  belongs_to  :owner
end
