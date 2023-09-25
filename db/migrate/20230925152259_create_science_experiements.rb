class CreateScienceExperiements < ActiveRecord::Migration[7.0]
  def change
    create_table :science_experiements do |t|
      t.references :scientist, null: false, foreign_key: true
      t.references :experiements, null: false, foreign_key: true

      t.timestamps
    end
  end
end
