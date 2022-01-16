# frozen_string_literal: true

class AddIndexToFollow < ActiveRecord::Migration[6.1]
  def change
    add_index(:follows, %i[following_id follower_id], unique: true, name: 'by_following_follower')
  end
end
