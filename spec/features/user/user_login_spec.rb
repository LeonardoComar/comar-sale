# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'User log in' do
  scenario 'Successfully' do
    address = Address.create!(address: 'Rua Paulo Setubal', zipcode: '1000', neighborhood: 'Boqueirão')
    unit = Unit.create!(name: 'Leozera Game House', cnpj: '99660023000190', status: 'active', phone: '41992430499', unit_type: 'store', address: address)
    human_resource = HumanResource.create!(name: 'Tchaikovsky', cpf: '63427270076', matriculation_code: 'VENDOR-001', status: 'active', unit: unit)
    role = Role.create!(name: 'Vendor', status: 'active')
    user = User.create!(email: 'vendor@email.com', password: '123456789', status: 'active', role: role, human_resource: human_resource)

    visit root_path
    click_on I18n.t(:sign_in, scope: %i[devise sessions new])
    fill_in I18n.t(:email, scope: %i[activerecord attributes user]), with: user.email
    fill_in I18n.t(:password, scope: %i[activerecord attributes user]), with: user.password
    click_on 'Log in'
    
    expect(current_path).to eq dashboard_index_path
    expect(page).to have_content(I18n.t(:signed_in, scope: %i[devise sessions]))
    expect(page).to have_link(I18n.t(:sign_out, scope: %i[devise sessions destroy]))
    expect(page).not_to have_link(I18n.t(:sign_in, scope: %i[devise sessions new]))
  end

  scenario 'User logout' do
    login_as(login_user_vendor, scope: :user)

    visit dashboard_index_path
    click_on I18n.t(:sign_out, scope: %i[devise sessions destroy])

    expect(current_path).to eq root_path
    expect(page).to have_content(I18n.t(:signed_out, scope: %i[devise sessions]))
    expect(page).to have_link(I18n.t(:sign_in, scope: %i[devise sessions new]))
    expect(page).not_to have_link(I18n.t(:sign_out, scope: %i[devise sessions destroy]))
  end

  xscenario 'Vendor view only options in menu for this role' do
  
  end

  xscenario 'Manager view only options in menu for this role' do

  end

end

feature 'Create User' do
end