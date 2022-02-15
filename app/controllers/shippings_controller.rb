# frozen_string_literal: true

class ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
  end

  def new
  end

  def create
  end
end