class AddDateToCa < ActiveRecord::Migration[5.1]
  def change
    add_column :cas, :not_before, :date
    add_column :cas, :not_after, :date
  end
end
