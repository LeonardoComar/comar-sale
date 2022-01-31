# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager update customer' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)
    
    #TO DO: Refatorar a unidade em testes
    unit = Unit.first
    customer = Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
    
    visit dashboard_index_path

    click_on 'Clientes'
    click_on 'Visualizar'
    click_on 'Editar'
    fill_in 'Nome', with: 'Johannes Brahms'
    fill_in 'Matrícula', with: '163254987'
    click_on 'Salvar'

    expect(current_path).to eq customer_path(customer)
    expect(page).to have_content('Johannes Brahms')
    expect(page).to have_content('163254987')
    expect(page).not_to have_content('Antonin Dvořák')
    expect(page).not_to have_content('789123456')
  end
end