class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :description
      t.decimal :price, default: 0, precision: 13, scale: 2
      t.belongs_to :invoice, foreign_key: true
      t.timestamps
    end
  end
end
