class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.string :title, null: false
      t.text :steps, null: false
      t.references :experiment, foreign_key: true, null: false

      t.timestamps
    end
  end
end
