class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def full_name
    :first_name + ' ' + :last_name
  end
end