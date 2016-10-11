class Store < ActiveRecord::Base
  has_many    :menus
  belongs_to  :owners
end
