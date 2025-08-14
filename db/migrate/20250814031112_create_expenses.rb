class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :category
      t.decimal :value, precision: 12, scale: 2, default: "0.0"

      t.timestamps
    end
  end
end
