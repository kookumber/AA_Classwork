class ChangeBandsColName < ActiveRecord::Migration[6.1]
  def change
    rename_column :bands, :band, :name
  end
end
