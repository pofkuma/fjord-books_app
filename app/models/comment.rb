# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :description, :user_id, presence: true

  def display_user_name
    user.name.empty? ? user.email : user.name
  end
end
