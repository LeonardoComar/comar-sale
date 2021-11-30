# frozen_string_literal: true

class Unit < ApplicationRecord
  belongs_to :address
  has_many :human_resources
end