class User < ApplicationRecord
  include ActionText::Attachable
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  scope :contact_notification_team,     -> { where("on_contact_notification_team = ?", true)}

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services
end
