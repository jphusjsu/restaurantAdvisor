class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :complaints
  validates_presence_of :first_name
  validates_presence_of :last_name
end
