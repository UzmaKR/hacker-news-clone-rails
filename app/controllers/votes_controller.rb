class VotesController < ApplicationController

	before_filter :authenticate_user

	def voteup
		resource = params[:votes][:imageable_type]
		resource_id = params[:votes][:imageable_id]
		resource_object = resource.capitalize.constantize.find(resource_id)
		newvote = resource_object.votes.build(params[:votes])
		if newvote.save
			flash[:success] = "Voted successfully for #{resource.capitalize}, Id: #{resource_id}."
			resource_object.numvotes += 1
			resource_object.save
		else
			flash[:notice] = "Vote not registered. You might already have voted on this post or comment."
		end
		case resource
		when "post"
			redirect_to posts_path
		when "comment"
			redirect_to post_path(resource_object.post.id)
		end
	end

end