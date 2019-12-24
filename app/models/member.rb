class Member < ApplicationRecord
    belongs_to :user
    
  def self.create_new_member(user, params)
    # add any other initialization for a new member
    return user.create_member( params )
  end
end
