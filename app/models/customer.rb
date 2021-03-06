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

  def add_credit(value_credit)
    if is_number?(value_credit) && value_credit.to_f > 0
      self.credit += value_credit.to_f
      save!
    else
      return false
    end
  end
  
  private

  def set_status
    self.status = "active"
  end

  def set_credit
    self.credit = 0.0
  end

  def is_number?(value_credit)
    true if Float(value_credit) rescue false
  end
end
