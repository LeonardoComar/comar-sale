# frozen_string_literal: true

class Shipping < ApplicationRecord
  belongs_to :product

  after_create :add_quantity_in_product
  after_destroy :decrease_quantity_in_product

  private

  def add_quantity_in_product
    search_product
    @prod.modify_quantity(self.quantity)
  end

  def decrease_quantity_in_product
    search_product
    @prod.modify_quantity(-(self.quantity))
  end

  def search_product
    @prod = Product.find(self.product_id)
  end
end
