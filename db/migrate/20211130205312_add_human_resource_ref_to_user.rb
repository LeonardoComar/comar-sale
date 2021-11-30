# frozen_string_literal: true

class AddHumanResourceRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :human_resource, null: false, foreign_key: true
  end
end
