# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :unit

  before_create :set_status, :set_credit
  
  validates :status, :credit, presence: true, on: %i[update]
  validates :name, :matriculation_code, :password, presence: true
  validates :name, :matriculation_code, uniqueness: true
  validates :password_confirmation, presence: true, on: %i[create]
  validates :password, confirmation: true, on: %i[create update]
  validates :password, length: { in: 6..12 }
  validates :password, numericality: { only_integer: true }

  def active?
    self.status == 'active'
  end
  
  private

  def set_status
    self.status = "active"
  end

  def set_credit
    self.credit = 0.0
  end
end
