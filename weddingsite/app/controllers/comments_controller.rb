class CommentsController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    @comments = Comment.all
    @users = User.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to '/'
    else
      redirect_to 'create'
    end
  end

  def show
    @comment = Comment.find(params[:current_user.id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
