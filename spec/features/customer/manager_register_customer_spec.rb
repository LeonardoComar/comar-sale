# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager register customer' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    visit dashboard_index_path

    click_on 'Clientes'
    click_on 'Adicionar'
    fill_in 'Nome', with: 'Johannes Brahms'
    fill_in 'Matrícula', with: '789123456'
    fill_in 'Senha', with: '123456'
    fill_in 'Repetir Senha', with: '123456'
    click_on 'Salvar'

    expect(current_path).to eq customers_path
    expect(page).to have_content('Johannes Brahms')
    expect(page).to have_content('Ativo')
  end
end