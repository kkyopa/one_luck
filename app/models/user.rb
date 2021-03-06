class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  paginates_per 5
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :lucks
  has_many :targets
  has_many :relationship_lucks, through: :relationships, source: :luck
  has_many :relationship_targets, through: :relationships, source: :target
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  accepts_nested_attributes_for :targets
  validates :name, presence: true

  def follow!(other_user)
  active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
  active_relationships.find_by(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
  end
end


