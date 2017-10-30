class Project < ApplicationRecord
  belongs_to :user

  has_many :notes

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
