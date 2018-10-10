class CreateUnavailableRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailable_ranges do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
