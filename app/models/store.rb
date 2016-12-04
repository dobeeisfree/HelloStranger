class Store < ActiveRecord::Base
  mount_uploader :main_picture, MainpicUploader
  has_many    :menu
  belongs_to  :owner
end
