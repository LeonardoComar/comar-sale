# frozen_string_literal: true

require 'rails_helper'
include LoginMethods
include ModelMethods

feature 'Manager delete product' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    product = Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)
    Shipping.create!(product: product, quantity: 10, validity: '14/08/2023')

    visit dashboard_index_path

    click_on 'Histórico de Remessas'
    click_on 'Excluir'

    expect(current_path).to eq shippings_path
    expect(Shipping.count).to eq 0
    expect(page).to have_content('Remessa excluído(a) com sucesso')
    expect(page).to have_content('Nenhum(a) Remessa Cadastrado(a)')
    expect(page).not_to have_content('Trento')
    expect(page).not_to have_content('10')
    expect(page).not_to have_content(Time.now.strftime("%d/%m/%Y"))
    expect(page).not_to have_content('14/08/2023')
  end
end