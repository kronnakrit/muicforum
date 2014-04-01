class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :index, :destroy]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: :destroy

  def destroy
  	@users = User.paginate(per_page: 15,page: params[:page])
  	@user = User.find(params[:id])
  	@user.destroy
  	flash[:success] = "User deleted."
  	respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end 
  end

  def index
  	@users = User.paginate(per_page: 15,page: params[:page])
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to Inter board!"
  		redirect_to(root_url)
  	else
  		render 'new'
  	end
  end
  
  def show
	@user = User.find(params[:id])
	@topics = @user.topics.paginate(per_page: 25, page: params[:t_page])
	@comments = @user.comments.find_all_by_dstatus(false)
  end 

  def new
  	@user = User.new
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profile updated"
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def edit
  end

  def admin
  	@user = User.find(params[:id])
  	if @user.toggle!(:admin)
  		redirect_to @user
  	end
  end

  def usersearch
  	if(params[:usersearch])
	  	respond_to do |format|
	      format.html { @users = User.usersearch(params[:usersearch]).paginate(per_page: 15, page: params[:page]) }
	      format.js
	    end 
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  	end

  	def signed_in_user
  		unless signed_in? 
  			store_location
  			redirect_to signin_url, notice: "Please sign in." 
  		end
  	end

  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_url) unless current_user?(@user)
  	end

  	def admin_user
  		redirect_to(root_url) unless current_user.admin?
  	end
end
