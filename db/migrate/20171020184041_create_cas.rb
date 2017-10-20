class CreateCas < ActiveRecord::Migration[5.1]
  def change
    create_table :cas do |t|
      t.string :subject
      t.integer :serial_number
      
      t.timestamps
    end
  end
end
