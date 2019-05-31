class PostsController < ApplicationController
  before_action :current_user, only: [:new, :create, :index]
  before_action :logged_in, only: [:new, :create]

  def new
  end

  def create
    post = Post.create(title: params[:post][:title], body: params[:post][:body], user: @current_user.id)
    redirect_to posts_index_url
  end

  def index
  end
  
end
