class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_number, index: {unique: true}
      t.belongs_to :user, foreign_key: true
      t.string :client
      t.decimal :total, default: 0, precision: 13, scale: 2
      t.timestamps
    end
  end
end
