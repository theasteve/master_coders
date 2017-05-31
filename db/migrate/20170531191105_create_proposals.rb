class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.text :summary
      t.string :hypothesis
      t.string :status
      t.references :requestor
      t.references :experimentor

      t.timestamps 
    end
  end
end
