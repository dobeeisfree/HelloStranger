class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :store, foreign_key: 'store_id'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
