class ChangeNameFromToInRent < ActiveRecord::Migration[5.1]
  def change
    rename_column :rents, :from, :start_date
    rename_column :rents, :to, :end_date
  end
end
