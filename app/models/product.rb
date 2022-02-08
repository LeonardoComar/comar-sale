# frozen_string_literal: true

class Product < ApplicationRecord

  belongs_to :unit

  def available?
    self.status == 'available'
  end
end
