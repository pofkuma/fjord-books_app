# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    follow = current_user.following_relationships.build(following_id: params[:user_id])

    if follow.save
      redirect_to user_path(params[:user_id]), notice: t('.notice')
    else
      redirect_to user_path(params[:user_id]), alert: t('.alert')
    end
  end

  def destroy
    follow = current_user.following_relationships.find_by(following_id: params[:user_id])

    if follow&.destroy
      redirect_to user_path(params[:user_id]), notice: t('.notice')
    else
      redirect_to user_path(params[:user_id]), alert: t('.alert')
    end
  end
end
