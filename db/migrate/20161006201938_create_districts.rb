class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.references :branch, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
