class CreateStation < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :time
      t.references :property, null: false, foreign_key: true

    end
  end
end
