# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager register product' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    visit dashboard_index_path

    click_on 'Lista de Produtos'
    click_on 'Adicionar'
    fill_in 'Nome', with: 'Trento'
    fill_in 'Preço', with: '2.50'
    fill_in 'Descrição', with: 'Chocolate'
    click_on 'Salvar'

    expect(current_path).to eq products_path
    expect(Product.count).to eq 1
    expect(page).to have_content('Produto criado(a) com sucesso')
    expect(page).to have_content('Trento')
    expect(page).to have_content('2,50')
    expect(page).to have_content('Indisponível')
    expect(page).to have_content('Chocolate')
  end
end