# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = current_user.following_relationships.build(following_id: params[:user_id])

    respond_to do |format|
      if follow.save
        format.html { redirect_to user_path(params[:user_id]), notice: t('controllers.follow.notice_create') }
      elsif follow.errors.where(:following).any?
        format.html { redirect_to user_path(params[:user_id]), alert: follow.errors.where(:following).last.full_message }
      else
        format.html { redirect_to user_path(params[:user_id]) }
      end
    end
  end

  def destroy
    follow = current_user.following_relationships.find_by(following_id: params[:user_id])

    respond_to do |format|
      if follow.destroy
        format.html { redirect_to user_path(params[:user_id]), notice: t('controllers.follow.notice_destroy') }
      else
        format.html { redirect_to user_path(params[:user_id]) }
      end
    end
  end
end
