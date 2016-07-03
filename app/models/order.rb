class Order < ActiveRecord::Base
	belongs_to :customer

	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :phone, :presence => true
	validates :pickup_date, :presence => true
	validates :address1, :presence => true
	# validates :city, :presence => true
	validates :zipcode, :presence => true
end
