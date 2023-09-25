class CreateExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :experiments do |t|
      t.string :name
      t.string :objective
      t.integer :num_months
      t.references :scientist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
