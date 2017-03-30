class ChangeDataTypeForReservations < ActiveRecord::Migration[5.0]
  def change
  	change_table :reservations do |t|
  		t.change :booking_start, :datetime
  		t.change :booking_end, :datetime
  	end
  end
end
