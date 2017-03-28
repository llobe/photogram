class User < ApplicationRecord
  # Direct associations

  has_many   :received_follows,
             :class_name => "Follow",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_follows,
             :class_name => "Follow",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  # Indirect associations

  has_many   :followers,
             :through => :received_follows,
             :source => :sender

  has_many   :followings,
             :through => :sent_follows,
             :source => :recipient

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
