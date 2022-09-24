class Group < ApplicationRecord
  belongs_to :user, class_name:'User'
  has_one_attached :image
  has_many :entities, foreign_key: 'group_id', class_name: 'Entity'
  validates :name, presence: true, length: { maximum: 255 }

  def total_amount
    entities.sum(:amount)
  end
end
