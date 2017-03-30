class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def index
    if params[:id].nil?
      @listings = Listing.all
      @message = 'All Listings'
    else
      @listings = Listing.where(user_id: params[:id])
      @message = "#{User.find(params[:id]).name}\'s Listings"
    end
    @listings = @listings.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')  
  end

  def new
    @listing = Listing.new
  end

  def show
    @user = User.find(@listing.user_id)
    @reservation = Reservation.new
  end

  def create
    @listing = current_user.listing.new(listing_params)
    if @listing.save
      redirect_to @listing  #go to the routes bfr template, Listings#show
    else
      render 'new'   #straight away go to the template without going thru the routes
    end 
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to edit_listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings
  end

  private
  
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :place_type, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :address, :price, :description, {images: []})
  end

end
