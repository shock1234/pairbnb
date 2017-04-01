class ReservationMailer < ApplicationMailer
	default from: "idealisticshy@gmail.com"

	def reservation_email(customer, host, listing, reservation)
		@customer = customer
		@host = host
		@listing = listing
		@reservation = reservation
		mail(to: @customer.email, subject: 'New Reservation')
	end
end
