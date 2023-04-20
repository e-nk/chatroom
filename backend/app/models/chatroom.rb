class Chatroom < ApplicationRecord
    belongs_to :user
    has_many :chatroom_members
    has_many :added_members, through: :chatroom_members, source: :user
    has_many :messages
end
