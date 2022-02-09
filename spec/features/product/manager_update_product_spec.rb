# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager update product' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)

    visit dashboard_index_path

    click_on 'Lista de Produtos'
    click_on 'Editar'

    fill_in 'Nome', with: 'Sonho de Valsa'
    fill_in 'Preço', with: '2.00'
    fill_in 'Descrição', with: 'Bombom'
    click_on 'Salvar'

    expect(current_path).to eq products_path
    expect(page).to have_content('Produto atualizado(a) com sucesso')
    expect(page).to have_content('Sonho de Valsa')
    expect(page).to have_content('2,00')
    expect(page).to have_content('Bombom')
    expect(page).not_to have_content('Trento')
    expect(page).not_to have_content('2,50')
    expect(page).not_to have_content('Chocolate')
  end
end