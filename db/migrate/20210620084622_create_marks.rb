class CreateMarks < ActiveRecord::Migration[6.1]
  def change
    create_table :marks do |t|
      t.integer :score
      t.string :letter
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
