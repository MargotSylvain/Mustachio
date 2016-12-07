class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :tags, through: :collections
         has_many :collections
         has_many :movies, through: :collections

         validates :first_name, :last_name, :username, :email, presence: true
         validates :username, uniqueness: {scope: :email}
end
