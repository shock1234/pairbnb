class ReservationMailer < ApplicationMailer
	default from: "idealisticshy@gmail.com"

	def reservation_email(customer, host, listing, booking)    #the worker (background process) will execute this method
		@customer = customer
		@host = host
		@listing = listing
		@reservation = booking
		mail(to: @customer.email, subject: 'New Reservation')
	end
end
