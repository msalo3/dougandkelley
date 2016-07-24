class CommentsController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    @users = User.all
    @comments = Comment.all.sort_by{|t| t.created_at}
    @comment = Comment.new
  end

  def new
    if session[:user_id] != nil
      @user = current_user
      @comment = Comment.new
    else
      redirect_to '/login'
    end
  end

  def create
    @user = current_user
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = "Comment Created!"
      redirect_to comments_path
    else
      redirect_to new_comment_path
    end
  end

  def show
    if session[:user_id] != nil
      @user = current_user
      @comment = Comment.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(:user_id => current_user.id)
  end
end
