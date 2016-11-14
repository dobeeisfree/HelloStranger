class Menu < ActiveRecord::Base

  belongs_to  :stores
  validates_presence_of :store_id

  belongs_to  :cookingmethods
  belongs_to  :foodglossaries
  belongs_to  :tastes
  belongs_to  :foodstuffs

  has_many    :reviews, through: :foreigners
end
