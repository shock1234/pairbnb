class ReservationsController < ApplicationController


	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			flash[:notice] = "successful"
			redirect_to current_user
		else
			flash[:notice] = @reservation.errors.full_messages
			redirect_to :back
		end
	end

	def index
		@reservations = Reservation.where(user_id: current_user.id)
		@reservations = @reservations.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
	end

	def show
	end

	def destroy
	end

	private

	def reservation_params
		params.require(:reservation).permit(:listing_id, :booking_start, :booking_end)
	end

	def find_listing
		@listing = Listing.find(params[:listing_id])
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

end

#<Reservation id: nil, user_id: nil, listing_id: nil, booking_start: nil, booking_end: nil, created_at: nil, updated_at: nil>


