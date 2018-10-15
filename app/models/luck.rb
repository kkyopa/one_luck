class Luck < ApplicationRecord
    mount_uploader :image, AvatarUploader
    belongs_to :user
    has_many :lucks
    # has_many :relationships, dependent: :destroy
    has_many :relationship_users, through: :relationship, source: :user
end
