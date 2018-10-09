class AddPropertyToPriceRange < ActiveRecord::Migration[5.2]
  def change
    add_reference :price_ranges, :property, foreign_key: true
  end
end
