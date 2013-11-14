class VotesController < ApplicationController
  def create
    @vote = current_user.votes.where(:post_id => params[:vote][:post_id]).first
    @vote ||= current_user.votes.create(vote_params)
    @vote.update(:up => params[:vote][:up])
    redirect_to :back
  end

  private

  def vote_params
    params.require(:vote).permit(:post_id)
  end
end

