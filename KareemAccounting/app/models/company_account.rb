class CompanyAccount < ActiveRecord::Base
	validates :name, :presence => true
	validates :address, :presence => true
	validates :phone, :presence => true
	validates :buyer, :presence => true
	validates :seller, :presence => true
end
