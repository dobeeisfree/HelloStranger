class Menu < ActiveRecord::Base
  belongs_to  :stores
  has_many    :reviews, through: :foreigners
end
