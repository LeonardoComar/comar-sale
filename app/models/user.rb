# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :role
  belongs_to :human_resource

  def has_permission?(internal_name_permission)
    return false if role.blank?

    permission = Permission.find_by(internal_name: internal_name_permission.to_s)

    role.permissions.include? permission
  end
end
