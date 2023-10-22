class ChangeDataRentToProperties < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :rent, :string
  end
end
