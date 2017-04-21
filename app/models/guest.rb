class Guest < ApplicationRecord
  has_many :appearances
  has_many :episodes, through: :appearances

  validates :name, presence: true
end
