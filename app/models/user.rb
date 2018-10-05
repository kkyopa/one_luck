class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :lucks
  has_many :targets
  has_many :relationship, dependent: :destroy
  has_many :relationship, dependent: :destroy
  has_many :relationship_lucks, through: :relationships, source: :luck
  has_many :relationship_targets, through: :relationships, source: :target
end
