class UpvotesController < ApplicationController

  def create
    link = Link.find(params[:link_id])
    link.upvote
    redirect_back fallback_location: root_path
  end

end
