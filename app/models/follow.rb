# frozen_string_literal: true

class Follow < ApplicationRecord
  validates :following, uniqueness: { scope: :follower }

  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
