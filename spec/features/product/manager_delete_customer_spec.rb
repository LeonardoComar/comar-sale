# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager delete product' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)

    visit dashboard_index_path

    click_on 'Lista de Produtos'
    click_on 'Visualizar'
    click_on 'Excluir'

    expect(current_path).to eq products_path
    expect(Product.count).to eq 0
    expect(page).to have_content('Produto excluído(a) com sucesso')
    expect(page).not_to have_content('Trento')
    expect(page).not_to have_content('2,50')
    expect(page).not_to have_content('Chocolate')
  end
end