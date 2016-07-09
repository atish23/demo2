class Order < ActiveRecord::Base
	belongs_to :customer
  	has_one :address
	accepts_nested_attributes_for :address
	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :phone, :presence => true
	# validates :pickup_date, :presence => true
	# validates :address1, :presence => true
	# # validates :city, :presence => true
	# validates :zipcode, :presence => true
	def status_enum
   	[['In Progress'],['Pending'],['Completed']]
	end
end
