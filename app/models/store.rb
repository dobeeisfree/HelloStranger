class Store < ActiveRecord::Base
  mount_uploader :main_picture, StoreImageUploader

  has_many    :menus
  belongs_to  :owner
end
