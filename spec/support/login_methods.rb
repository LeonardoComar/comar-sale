# frozen_string_literal: true

module LoginMethods
	def login_user_vendor
    address = Address.create!(address: 'Rua Paulo Setubal', zipcode: '1000', neighborhood: 'Boqueirão')
    unit = Unit.create!(name: 'Leozera Game House', cnpj: '99660023000190', status: 'active', phone: '41992430499', unit_type: 'store', address: address)
    human_resource = HumanResource.create!(name: 'Tchaikovsky', cpf: '63427270076', matriculation_code: 'VENDOR-001', status: 'active', unit: unit)
    role = Role.create!(name: 'Vendor', status: 'active')
    user = User.create!(email: 'vendor@email.com', password: '123456789', status: 'active', role: role, human_resource: human_resource)
		user
	end
end