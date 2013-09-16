class CommentsController < ApplicationController

	before_filter :authenticate_user, only: [:create, :show_user_comments]

	def index
		@comments = Comment.all
	end

	def create
		@comment = Comment.new(params[:comment])
		@comment.user = current_user
		@post = Post.find(params[:comment][:post_id])
		if @comment.save
			flash[:success] = "New comment created."
		else
			flash[:error] = "Please read error messages."
		end
		redirect_to :back
	end

	def show_user_comments
		@comments = current_user.comments
		render 'show'
	end

end