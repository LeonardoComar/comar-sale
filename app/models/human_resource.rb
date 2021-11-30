# frozen_string_literal: true

class HumanResource < ApplicationRecord
  belongs_to :unit
  has_one :user
end
