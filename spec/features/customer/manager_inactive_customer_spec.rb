# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager inactive customer' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)
    
    unit = Unit.first
    customer = Customer.create!(name: 'Antonin Dvořák', matriculation_code: '789123456', password: '123456', password_confirmation: '123456', unit: unit)
    
    visit customer_path(customer)
    click_on 'Inativar'

    expect(current_path).to eq customers_path
    expect(Customer.where(status: 'active').count).to eq 0
    expect(Customer.count).to eq 1
    expect(page).not_to have_content('Antonin Dvořák')
    expect(page).not_to have_content('789123456')
  end
end