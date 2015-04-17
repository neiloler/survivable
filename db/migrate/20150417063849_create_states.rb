class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abr
      t.string :full_name
      t.integer :population_military
      t.integer :population_total
      t.integer :housing_units_total
      t.integer :housing_units_occupied
      t.integer :housing_units_vacant

      t.timestamps null: false
    end
  end
end
