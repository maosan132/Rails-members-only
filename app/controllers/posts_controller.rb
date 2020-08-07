class PostsController < ApplicationController
  #before_action :set_post, only: %i[show edit update destroy]
  #before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_param)
    @post.member_id = current_member.id
    if @post.save
      redirect_to root_path
    else
      render new
    end
  end
  
private

  def post_param
    params.require(:post).permit(:title, :body)
  end

end
