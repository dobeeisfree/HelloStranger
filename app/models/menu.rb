class Menu < ActiveRecord::Base
  mount_uploader :food_picture, MenuImageUploader

  validates_presence_of :store_id

  # db Associations
  belongs_to  :store
  has_many  :cookingmethod
  has_many  :foodglossary
  has_many  :taste
  has_many  :foodstuff

  has_many    :review

end
