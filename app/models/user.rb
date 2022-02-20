class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true, length: {minimum: 1}
  validates :surname, presence: true, length: {minimum: 1}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :tags, dependent: :destroy
end
