class Foreigner < ActiveRecord::Base
  has_many :review, foreign_key: 'review_id'
end
