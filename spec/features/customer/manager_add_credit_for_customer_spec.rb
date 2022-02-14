# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager add credit' do
  xscenario 'Successfully' do
    login_as(login_user_manager, scope: :user)
    
    unit = Unit.first
    customer = Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
    
    visit dashboard_index_path

    click_on 'Clientes'
    click_on 'Visualizar'
    fill_in 'Crédito', with: '10.00'
    click_on 'Salvar'

    expect(current_path).to eq customer_path(customer)
    expect(page).to have_content('R$ 10,00')
    expect(page).not_to have_content('R$ 0,00')
    expect(page).to have_content('Crédito adicionado com sucesso!')
  end
end