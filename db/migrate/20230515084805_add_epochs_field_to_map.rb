class AddEpochsFieldToMap < ActiveRecord::Migration[7.0]
  def change
    add_column :maps, :epochs, :integer, default: 1
    add_column :maps, :learning_rate, :float, default: 1.0
    add_column :maps, :sigma, :float, default: 1.0
    add_column :maps, :max_iter, :integer, default: 3000
  end
end
