class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, UserPhotoUploader


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:facebook]

  has_many :tags, through: :collections, dependent: :destroy
  has_many :tag_collections, through: :collections
  has_many :collections, dependent: :destroy
  has_many :movies, through: :collections
  has_many :reviews, through: :collections

  validates :username, :email, presence: true
  validates :username, uniqueness: {scope: :email}

  # Add friendship to user
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

# to call all your friends

def friends
  active_friends | received_friends
end

# to call your pending sent or received

def pending
  pending_friends | requested_friendships
end

def self.find_for_facebook_oauth(auth)
  user_params = auth.to_h.slice(:provider, :uid)
  user_params.merge! auth.info.slice(:email, :first_name, :last_name)
  user_params[:username] = auth.extra.raw_info.name
  user_params[:facebook_picture_url] = auth.info.image
  user_params[:token] = auth.credentials.token
  user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

  user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.search(search)
    where("username ILIKE ?", "%#{search}%")
    # where("first_name ILIKE ?", "%#{search}%")
    # where("last_name ILIKE ?", "%#{search}%")
  end


end
