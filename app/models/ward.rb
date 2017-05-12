class Ward < ActiveRecord::Base
  has_many :hospital_stay_lists, inverse_of: :ward, dependent: :destroy
  accepts_nested_attributes_for :hospital_stay_lists, allow_destroy: true

  validates :floor, presence: true
  validates :number, presence: true, uniqueness: { scope: [:floor,:departmen],message: "палата на данном этаже с выбранным отделением уже существует" }
  validates :departmen, presence: true
  validates :capacity, presence: true, numericality: {greater_than_or_equal_to: 1}
end
