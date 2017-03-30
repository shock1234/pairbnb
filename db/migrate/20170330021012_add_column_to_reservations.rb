class AddColumnToReservations < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :num_guests , :integer
  end
end
