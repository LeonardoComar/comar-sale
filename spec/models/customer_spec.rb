require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validations model' do
    it 'fields cannot be blank' do
      customer = Customer.new

      customer.valid?

      expect(customer.errors[:name]).to include ('não pode ficar em branco')
      expect(customer.errors[:matriculation_code]).to include ('não pode ficar em branco')
      expect(customer.errors[:password]).to include ('não pode ficar em branco')
      expect(customer.errors[:password_confirmation]).to include ('não pode ficar em branco')
    end
  end
end
