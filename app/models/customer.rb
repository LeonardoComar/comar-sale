# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :unit

  before_create :set_status

  def active?
    self.status == 'active'
  end
  
  private

  def set_status
    self.status = "active"
  end
end
