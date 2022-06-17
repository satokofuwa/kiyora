class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices, id: :bigint do |t|
      t.references	:task , null: false, foreign_key: true
      t.serial	:invoice_no, null: false, start: 10000
      t.date	:issued_on, null: false
      t.date	:support_at, null: false
      t.bigint	:tax_included, default: 0
      t.string	:bank, null: false
      t.text	:content
      t.datetime	:created_at, null: false
      t.datetime	:updated_at, null: false
    end
  end
end
