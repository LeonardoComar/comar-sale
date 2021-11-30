# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :category
      t.string :internal_name

      t.timestamps
    end
  end
end
