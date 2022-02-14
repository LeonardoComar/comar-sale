# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager view products' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)
    Product.create!(name: 'Cheetos', price: 4.0, description: 'Salgadinho', unit: unit)

    visit dashboard_index_path

    click_on 'Lista de Produtos'

    expect(current_path).to eq products_path
    expect(Product.count).to eq 2
    expect(page).to have_content('Trento')
    expect(page).to have_content('2,50')
    expect(page).to have_content('Indisponível')
    expect(page).to have_content('Chocolate')
    expect(page).to have_content('Cheetos')
    expect(page).to have_content('4,00')
    expect(page).to have_content('Salgadinho')
  end
end