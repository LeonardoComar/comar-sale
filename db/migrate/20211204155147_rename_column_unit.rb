# frozen_string_literal: true

class RenameColumnUnit < ActiveRecord::Migration[6.1]
  def change
    rename_column(:units, :type, :unit_type)
  end
end
