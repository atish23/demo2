class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
end
