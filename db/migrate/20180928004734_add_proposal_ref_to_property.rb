class AddProposalRefToProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :properties, :proposal, foreign_key: true
  end
end
