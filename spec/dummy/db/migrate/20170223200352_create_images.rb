# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :attachment
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
