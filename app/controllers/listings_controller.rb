class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def index
    if !params.nil?
    @listing = current_user.listing
    end

  end

  def new
    @listing = Listing.new
  end

  def show
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
  end

  private
  
  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :place_type, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :zipcode, :address, :price, :description)
  end

end
