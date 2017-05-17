class Stripclub < ApplicationRecord
  has_many :reviews

  validates :name, :location, uniqueness: true, presence: true
end
