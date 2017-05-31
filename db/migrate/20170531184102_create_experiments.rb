class CreateExperiments < ActiveRecord::Migration[5.0]
  def change
    create_table :experiments do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.text :results
      t.text :conclusions
      # t.references :proposal, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
