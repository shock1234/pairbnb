class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
    	t.belongs_to :user
    	t.belongs_to :listing
    	t.date :booking_start
    	t.date :booking_end
    	t.timestamps
    end
  end
end
