# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :unit
  has_many :shippings

  before_create :set_status, :set_quantity

  validates :name, :price, presence: true
  validates :price, numericality: true

  def available?
    self.status == "available"
  end

  def add_quantity(value_quantity)
    self.quantity += value_quantity
    verify_status if save!
  end

  private
  
  def set_status
    self.status = "unavailable"
  end
  
  def set_quantity
    self.quantity = 0
  end

  def verify_status
    if self.quantity == 0
      self.status = "unavailable"
    else
      self.status = "available"
    end
    save!
  end
end
