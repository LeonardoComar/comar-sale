# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :matriculation_code
      t.string :password
      t.decimal :credit, precision: 5, scale: 2
      t.string :status
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
