class Reservation < ApplicationRecord
	validate :room_available, :check_max_guests

	belongs_to :user
	belongs_to :listing

	def room_available
		listing.reservations.each do |y|
			if overlap?(self,y)
				return self.errors.add(:date_overlap, "Try other date")
			end
		end
	end

	def overlap?(x,y)
		(x.booking_start - y.booking_end) * (y.booking_start - x.booking_end) >= 0
	end

	def check_max_guests
	    max_guests = listing.guest_number
	    return if num_guests <= max_guests    #if num_guests < max_guests return true else errors.add end
	    errors.add(:max_guests, "Max guests number exceeded")
  	end

  	def total_price
	    price = listing.price
	    num_dates = (booking_end - booking_start)/86400
	    return price * num_dates
  	end

end
