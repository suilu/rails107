class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def edit
    @posts = current_user.posts
    @post = Post.find(params[:group_id])
  end

  def update
    @posts = current_user.posts
    @post = Post.find(params[:group_id])

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @posts = Post.destroy
    redirect_to posts_path, alert: "Deleted success".
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
end
