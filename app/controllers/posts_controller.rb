class PostsController < ApplicationController
  require 'will_paginate/array'
  before_filter :authorize, only: [:edit, :update, :create]
  before_filter :login_check, :except => [:index, :show]

  def index
    @posts = Post.sort_by_votes.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @post = current_user.posts.new
    # @post = User.find(session[:user_id]).posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Your post was successfully created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:user_id => current_user.id, :commentable_id => @post.id, :commentable_type => 'Post') if current_user
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
      # params[:post].permit(:title, :url)
    end

    def login_check
      redirect_to login_path, alert: 'You must be logged in to post' unless current_user.present?
    end

end