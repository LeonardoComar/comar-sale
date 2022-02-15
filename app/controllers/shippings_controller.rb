# frozen_string_literal: true

class ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
  end

  def new
    @shipping = Shipping.new
    @products = Product.all
  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save!
      flash[:success] = I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: I18n.t(:shipping, scope: %i[activerecord models], count: 1))
      redirect_to shippings_path
    else
      render :new
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])

    if @shipping.destroy!
      flash[:success] = I18n.t(:exclused_successfully, scope: %i[_dictionary], resource_name: I18n.t(:shipping, scope: %i[activerecord models], count: 1))
      redirect_to shippings_path
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:product_id, :quantity, :validity)
  end

  def set_shipping
    @shipping = Shipping.find(params[:id])
  end
end