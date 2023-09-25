class CreateExperiments < ActiveRecord::Migration[7.0]
  def change
    create_table :experiments do |t|
      t.string :name
      t.string :description
      t.integer :num_months

      t.timestamps
    end
  end
end
