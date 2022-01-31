# frozen_string_literal: true

module ModelMethods
	def create_customer
    address = Address.create!(address: 'Rua Paulo Setubal', zipcode: '1000', neighborhood: 'Boqueirão')
    unit = Unit.create!(name: 'Leozera Doces', cnpj: '99660023000190', status: 'active', phone: '41992430499', unit_type: 'store', address: address)
    Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
	end
end