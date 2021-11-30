# frozen_string_literal: true

class CreateHumanResources < ActiveRecord::Migration[6.1]
  def change
    create_table :human_resources do |t|
      t.string :name
      t.string :nickname
      t.string :cpf
      t.string :phone
      t.string :matriculation_code
      t.string :status
      t.date :birth_date
      t.references :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
