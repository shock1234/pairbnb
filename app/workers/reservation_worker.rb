class ReservationWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(reservation_id) 
    # Do something
    reservation = Reservation.find(reservation_id)
    customer = reservation.user
    host = reservation.listing.user
    listing = reservation.listing
    booking = reservation 
    ReservationMailer.reservation_email(customer, host, listing, booking).deliver_now
  end
end
