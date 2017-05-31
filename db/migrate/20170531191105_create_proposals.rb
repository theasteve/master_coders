class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.string :hypothesis, null: false
      t.string :status, null: false
      t.references :requestor
      t.references :experimentor

      t.timestamps
    end
  end
end
