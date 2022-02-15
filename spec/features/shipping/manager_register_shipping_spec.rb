# frozen_string_literal: true

require 'rails_helper'
include LoginMethods

feature 'Manager register product' do
  scenario 'Successfully' do
    login_as(login_user_manager, scope: :user)

    unit = Unit.first
    product = Product.create!(name: 'Trento', price: 2.5, description: 'Chocolate', unit: unit)

    visit dashboard_index_path

    click_on 'Histórico de Remessas'
    click_on 'Adicionar'
    select product.name
    fill_in 'Quantidade', with: 10

    within('#shipping_validity_3i') do
      select '15'
    end

    within('#shipping_validity_2i') do
      select 'Fevereiro'
    end

    within('#shipping_validity_1i') do
      select '2025'
    end

    click_on 'Salvar'

    expect(current_path).to eq shippings_path
    expect(Shipping.count).to eq 1
    expect(page).to have_content('Remessa criado(a) com sucesso')
    expect(page).to have_content('Trento')
    expect(page).to have_content('10')
    expect(page).to have_content('15/02/2025')
  end
end