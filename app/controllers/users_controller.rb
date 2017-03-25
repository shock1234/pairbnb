class UsersController < Clearance::UsersController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	
	def show
	end

	def edit
	end

	def update
		@user.update(user_params)
		redirect_to edit_user_path(@user)
	end

	def destroy
		@user.destroy
		redirect_to '/'
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	#strong parameters permits long_url to be exposed, no authenticity token
	#<ActionController::Parameters {"long_url"=>"nutrivelo.com"} permitted: true>
	def user_params
		params.require(:user).permit(:email, :password, :name, :first_name, :last_name, :gender, :phone, :country, :birthday)
	end

end