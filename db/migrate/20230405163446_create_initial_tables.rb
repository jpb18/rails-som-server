class CreateInitialTables < ActiveRecord::Migration[7.0]
  def change
    create_table :maps, id: :integer do |t|
      t.integer :feature_number
      t.integer :width
      t.integer :height
      t.json :map_state

      t.timestamps
    end

    create_table :sample_data_entries, id: :integer do |t|
      t.string :label
      t.json :value
      t.belongs_to :map, type: :integer, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
