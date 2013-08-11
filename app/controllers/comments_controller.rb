class CommentsController < ApplicationController
  def create
    p params
    comment_one = Comment.new(:user_id => (current_user.id if current_user), :page_id => params[:page_id], :question_id => 1, :text => params[:comment][:comment_one])
    comment_two = Comment.new(:user_id => (current_user.id if current_user), :page_id => params[:page_id], :question_id => 2, :text => params[:comment][:comment_two])

    if comment_one.save && comment_two.save
      redirect_to :back
    else
      redirect_to root_path
    end
  end
end