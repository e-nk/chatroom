class User < ApplicationRecord
    has_secure_password

    has_many :chatroom
    has_many :chatroom_members
    has_many :enrolled_chatrooms , through: :chatroom_members, source: :chatroom
    has_many :messages

    validates_presence_of :email
    validates_uniqueness_of :email

    

end
