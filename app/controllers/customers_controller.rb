# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update]

  def index
    @customers = Customer.where(unit_id: current_user.human_resource.unit.id)
  end

  def show
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

  def edit
  end

  def update
    @customer.name = params[:customer][:name]
    @customer.matriculation_code = params[:customer][:matriculation_code]
    if @customer.save!(validate: false)
      redirect_to @customer
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :matriculation_code, :password, :password_confirmation)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
