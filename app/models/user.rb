class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tasks, dependent: :destroy
         validates :first_name, :last_name, :mobile_number, :email, :date_of_birth, presence: true
         validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'must be a valid email address' }
         validates :mobile_number, format: { with: /\A[6789]\d{9}\z/, message: 'must be a valid phone number (10 digits starting with 6, 7, 8, or 9)' }
end
