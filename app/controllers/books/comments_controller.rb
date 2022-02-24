# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    @comment.save!
    redirect_to @book, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end