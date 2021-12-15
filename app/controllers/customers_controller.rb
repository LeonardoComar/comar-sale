# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.where(unit_id: current_user.human_resource.unit.id)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.unit_id = current_user.human_resource.unit.id

    if @customer.save!
      flash[:success] = I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: I18n.t(:customer, scope: %i[activerecord models], count: 1))
      redirect_to customers_path
    else
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :matriculation_code, :password)
  end
end
