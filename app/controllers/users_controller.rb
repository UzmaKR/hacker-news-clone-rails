class UsersController < ApplicationController

	before_filter :authenticate_user, only: [:show, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "New user successfully created."
			render 'show'
		else
			flash[:error] = "Please read error messages and resubmit."
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash.now[:success] = "#{@user.name} successfully updated."
		else
			flash.now[:error] = "#{@user.name} not updated."
		end
		render :show
	end
end