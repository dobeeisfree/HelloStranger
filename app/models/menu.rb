class Menu < ActiveRecord::Base
  belongs_to  :store
  has_many    :review
end
