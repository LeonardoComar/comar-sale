# frozen_string_literal: true

class CreateUnit < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :name
      t.string :cnpj
      t.string :status
      t.string :phone
      t.string :type
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
