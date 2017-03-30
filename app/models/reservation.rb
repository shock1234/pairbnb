class Reservation < ApplicationRecord
	validate :room_available

	belongs_to :user
	belongs_to :listing

	def room_available
		listing.reservations.each do |y|
			if overlap?(self,y)
				return self.errors.add(:message, "Try other date")
			end
		end
	end

	def overlap?(x,y)
		(x.booking_start - y.booking_end) * (y.booking_start - x.booking_end) >= 0
	end

	def check_max_guests
	    max_guests = listing.max_guests
	    return if num_guests < max_guests
	    errors.add(:max_guests, "Max guests number exceeded")
  	end

  	def total_price
	    price = listing.price
	    num_dates = (start_date..end_date).to_a.length
	    return price * num_dates
  	end

end
