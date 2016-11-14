class Address < ActiveRecord::Base
	has_many :candidates
	validates :house_number, :street_name, :city_name, :mandal_name, :district_name, :state_name, :country_name, :pin_code, presence: true
end
