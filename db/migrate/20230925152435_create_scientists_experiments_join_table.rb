class CreateScientistsExperimentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :scientists_experiments do |t|
      t.references :scientist, foreign_key: true
      t.references :experiment, foreign_key: true

      t.timestamps
    end
  end
end
