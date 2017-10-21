class CreateCertificates < ActiveRecord::Migration[5.1]
  def change
    create_table :certificates do |t|
      t.references :ca, foreign_key: true
      t.string :subject
      t.string :issuer
      t.integer :serial_number
      t.date :not_before
      t.date :not_after

      t.timestamps
    end
  end
end
