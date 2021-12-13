# frozen_string_literal: true

module LoginMethods
	def login_user_vendor
    address = Address.create!(address: 'Rua Paulo Setubal', zipcode: '1000', neighborhood: 'Boqueirão')
    unit = Unit.create!(name: 'Leozera Doces', cnpj: '99660023000190', status: 'active', phone: '41992430499', unit_type: 'store', address: address)
    human_resource = HumanResource.create!(name: 'Tchaikovsky', cpf: '63427270076', matriculation_code: 'VENDOR-001', status: 'active', unit: unit)
    user = User.create!(email: 'vendedor@email.com', password: '123456789', status: 'active', role_id: 1, human_resource: human_resource)
		user
	end

  def login_user_manager
    address = Address.create!(address: 'Rua Paulo Setubal', zipcode: '1000', neighborhood: 'Boqueirão')
    unit = Unit.create!(name: 'Leozera Doces', cnpj: '99660023000190', status: 'active', phone: '41992430499', unit_type: 'store', address: address)
    human_resource = HumanResource.create!(name: 'Beethoven', cpf: '27874734076', matriculation_code: 'MANAGER-001', status: 'active', unit: unit)
    user = User.create!(email: 'gerente@email.com', password: '123456789', status: 'active', role_id: 2, human_resource: human_resource)
		user
	end
end