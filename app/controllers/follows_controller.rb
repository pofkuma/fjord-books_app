# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = current_user.following_relationships.build(following_id: params[:user_id])

    respond_to do |format|
      if follow.save
        format.html { redirect_to user_path(params[:user_id]), notice: t('controllers.follow.notice_create') }
      else
        format.html { redirect_to user_path(params[:user_id]) }
      end
    end
  end
end
