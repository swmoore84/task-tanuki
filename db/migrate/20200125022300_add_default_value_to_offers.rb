class AddDefaultValueToOffers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :offers, :status, "pending"
  end
end
