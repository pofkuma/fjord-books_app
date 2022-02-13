# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  def display_user_name
    user.name.empty? ? user.email : user.name
  end
end
