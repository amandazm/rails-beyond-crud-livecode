class Review < ApplicationRecord
  belongs_to :stripclub

  validates :content, presence: true
  validates :rating, inclusion: {in: [0,1,2,3], allow_nil: false}
end
