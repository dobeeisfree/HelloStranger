class Foreigner < ActiveRecord::Base
  has_many :review,  through: :menus

  validates :name, :password, :lang, :for_taboo, :presence => true
  validates_numericality_of :for_taboo, :only_integer => true
  validates_numericality_of :lang, :only_integer => true

end
