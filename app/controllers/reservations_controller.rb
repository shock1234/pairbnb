class ReservationsController < ApplicationController
	before_action :set_reservation, only: [:show, :destroy, :checkout]
	before_action :set_mailer, only: [:create]

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			flash[:success] = "Reservation Successful!"
			# reservation_email(customer, host, listing, reservation)
			# Tell the ReservationMailer to send an email after save
			ReservationMailer.reservation_email(@customer, @host, @listing, @reservation).deliver_now
			# redirect_to @reservation.user #redirect to user profile
			redirect_to reservation_path(@reservation) #redirec to reservation#show
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
		@client_token = Braintree::ClientToken.generate
	end

	def destroy
		@reservation.destroy
		redirect_to :back
	end

	def checkout
		@reservation = Reservation.find(params[:id])
		nonce_form_the_client = params[:checkout_form][:payment_method_nonce]

		result = Braintree::Transaction.sale(
			amount: "#{@reservation.total_price}",
			payment_method_nonce: nonce_form_the_client,
			options: {
				submit_for_settlement: true
			}
			)
		if result.success?
			# @reservation.update(payment_status: 1) #will not work because failed in validation
			@reservation.update_attribute('payment_status', 1) #bypass validation. Or @reservation.payment_status = 1; @reservation.save(:validate => false)
			flash[:success] = "Transaction Successful!"
			redirect_to reservation_path(@reservation)
		else
			flash[:error] = "Transaction failed. Please try again."
			redirect_to reservation_path(@reservation)
		end
	end




	private

	def reservation_params
		params.require(:reservation).permit(:listing_id, :booking_start, :booking_end, :num_guests, :payment_status)
	end

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end

	def set_mailer  # reservation_email(customer, host, listing, reservation)
		@customer = User.find(current_user.id)
		@listing = Listing.find(params[:reservation][:listing_id])
		@host = User.find(@listing.user_id) 
	end

end

#<Reservation id: nil, user_id: nil, listing_id: nil, booking_start: nil, booking_end: nil, created_at: nil, updated_at: nil>


