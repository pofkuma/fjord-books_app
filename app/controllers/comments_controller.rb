# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to @comment.commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def comment_params
    params.require(:comment).permit(:description, :user_id, :commentable_id, :commentable_type)
  end
end
