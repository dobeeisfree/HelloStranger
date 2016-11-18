class Diary < ActiveRecord::Base
  belongs_to  :foreigner
  belongs_to  :store
end
