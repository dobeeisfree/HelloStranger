class Store < ActiveRecord::Base
  has_many    :menu
  belongs_to  :owner
end
