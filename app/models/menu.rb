class Menu < ActiveRecord::Base
  mount_uploader :food_picture, MenuImageUploader

  validates_presence_of :store_id

  # db Associations
  belongs_to  :store
  belongs_to  :cookingmethod
  belongs_to  :foodglossary
  belongs_to  :taste
  belongs_to  :foodstuff

  has_many    :review

end
