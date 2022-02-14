# frozen_string_literal: true

class Product < ApplicationRecord

  belongs_to :unit

  before_create :set_status, :set_quantity

  validates :name, :price, presence: true
  validates :price, numericality: true

  def available?
    self.status == 'available'
  end

  private
  
  def set_status
    self.status = "unavailable"
  end
  
  def set_quantity
    self.quantity = 0
  end
end
