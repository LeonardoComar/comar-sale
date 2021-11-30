# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :zipcode
      t.string :neighborhood
      t.string :complement
      t.string :reference_point
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
