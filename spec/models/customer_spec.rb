require 'rails_helper'
include ModelMethods

RSpec.describe Customer, type: :model do
  context 'validations model customer' do
    it 'fields cannot be blank' do
      customer = Customer.new

      customer.valid?

      expect(customer.errors[:name]).to include ('não pode ficar em branco')
      expect(customer.errors[:matriculation_code]).to include ('não pode ficar em branco')
      expect(customer.errors[:password]).to include ('não pode ficar em branco')
      expect(customer.errors[:password_confirmation]).to include ('não pode ficar em branco')
    end

    it 'password greater_than_or_equal_to 6 characters' do
      customer = Customer.new 

      customer.password = '123456'

      customer.valid?

      expect(customer.errors[:password]).not_to include ('é muito curto (mínimo: 6 caracteres)')
    end

    it 'password less_than_or_equal_to 12 characters' do
      customer = Customer.new 

      customer.password = '123456789102'

      customer.valid?

      expect(customer.errors[:password]).not_to include ('é muito longo (máximo: 12 caracteres)')
    end
    
    it 'password cant be less_than 6 characters' do
      customer = Customer.new 
  
      customer.password = '12345'
  
      customer.valid?
  
      expect(customer.errors[:password]).to include ('é muito curto (mínimo: 6 caracteres)')
    end

    it 'password cant be greater_than 12 characters' do
      customer = Customer.new 

      customer.password = '1234567891023'

      customer.valid?

      expect(customer.errors[:password]).to include ('é muito longo (máximo: 12 caracteres)')
    end

    it 'password characters are only characters numbers' do
      customer = Customer.new 

      customer.password = '123456'

      customer.valid?

      expect(customer.errors[:password]).not_to include ('não é um número')
    end

    it 'password cant receive special characters and letters' do
      customer = Customer.new 

      customer.password = '12a3456@'

      customer.valid?

      expect(customer.errors[:password]).to include ('não é um número')
    end

    it 'password_confirmation must be equal password' do
      customer = Customer.new

      customer.password = '123456'

      customer.password_confirmation = '123456'

      customer.valid?

      expect(customer.errors[:password_confirmation]).not_to include ('não é igual a Senha')
    end

    it '!password_confirmation must be equal password' do
      customer = Customer.new

      customer.password = '123456'

      customer.password_confirmation = '1234567'

      customer.valid?

      expect(customer.errors[:password_confirmation]).to include ('não é igual a Senha')
    end

    it 'matriculation_code must be unique' do
      create_customer

      customer = Customer.new 

      customer.matriculation_code = '789123456'

      customer.valid?

      expect(customer.errors[:matriculation_code]).to include ('já está em uso')
    end

    it 'name must be unique' do
      create_customer

      customer = Customer.new 

      customer.name = 'Antonin Dvořák'

      customer.valid?

      expect(customer.errors[:name]).to include ('já está em uso')
    end
  end
end