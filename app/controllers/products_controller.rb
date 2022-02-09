# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update]

  def index
    @products = Product.where(unit_id: current_user.human_resource.unit.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.price = params[:product][:price].to_f
    @product.unit_id = current_user.human_resource.unit.id

    if @product.save!
      flash[:success] = I18n.t(:created_successfully, scope: %i[_dictionary], resource_name: I18n.t(:product, scope: %i[activerecord models], count: 1))
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.name = params[:product][:name]
    @product.price = params[:product][:price].to_f
    @product.description = params[:product][:description]

    if @product.save!
      flash[:success] = I18n.t(:updated_successfully, scope: %i[_dictionary], resource_name: I18n.t(:product, scope: %i[activerecord models], count: 1))
      redirect_to products_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end