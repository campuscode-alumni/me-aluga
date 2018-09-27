class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_amount
      t.integer :total_guests
      t.text :purpose

      t.timestamps
    end
  end
end
