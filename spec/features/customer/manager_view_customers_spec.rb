# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager view customers' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)
    
    unit = Unit.first
    Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
    
    visit dashboard_index_path

    click_on 'Clientes'

    expect(current_path).to eq customers_path
    expect(page).to have_content('Antonin Dvořák')
    expect(page).to have_content('Ativo')
  end

  scenario 'view one customer (show)' do
    login_as(login_user_manager, scope: :user)
    
    unit = Unit.first
    customer = Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
    
    visit dashboard_index_path

    click_on 'Clientes'
    click_on 'Visualizar'

    expect(current_path).to eq customer_path(customer)
    expect(page).to have_content('Antonin Dvořák')
    expect(page).to have_content('789123456')
    expect(page).to have_content('R$ 0,00')
    expect(page).to have_content('Ativo')
  end
end