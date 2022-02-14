# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.string :description
      t.integer :quantity
      t.string :status
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
