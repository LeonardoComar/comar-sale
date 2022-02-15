# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager view shippings' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    Product.create!(name: 'Chetos', price: 4.0, description: 'Salgadinho', unit: unit)
    product = Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)
    Shipping.create!(product: product, quantity: 10, validity: '14/08/2023')

    visit dashboard_index_path

    click_on 'Histórico de Remessas'

    expect(current_path).to eq shippings_path
    expect(Shipping.count).to eq 1
    #expect(Product.first.status).to eq 'available'
    expect(page).to have_content('Trento')
    expect(page).to have_content('10')
    expect(page).to have_content(Time.now.strftime("%d/%m/%Y"))
    expect(page).to have_content('14/08/2023')
  end
end