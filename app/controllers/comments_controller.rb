class CommentsController < ApplicationController
  before_filter :login_check, :except => [:index, :show]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
    @comments = Comment.where(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.post 
    else
      redirect_to @comment.post 
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

  def login_check
    redirect_to login_path, alert: 'You must be logged in to post' unless current_user.present?
  end
end

