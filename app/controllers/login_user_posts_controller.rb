class LoginUserPostsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = LoginUserPost.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     redirect_to new_login_user_post_path
    else
     render :new
    end
  end

  def new
   @post = LoginUserPost.new
   @posts = LoginUserPost.all
  end

  private
  def post_params
   params.require(:login_user_post).permit(:title, :body)
  end
end
