class Menu < ActiveRecord::Base

  belongs_to  :stores

  belongs_to  :cookingmethods
  belongs_to  :foodglossaries
  belongs_to  :tastes
  belongs_to  :foodstuffs

  has_many    :reviews, through: :foreigners
end
