# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
