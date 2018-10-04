class AddPropertyRefToProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :property, foreign_key: true
  end
end
