class HospitalStayList < ActiveRecord::Base
  belongs_to :patient, inverse_of: :hospital_stay_lists
  belongs_to :ward, inverse_of: :hospital_stay_lists

  accepts_nested_attributes_for :ward, allow_destroy: true, update_only: true, reject_if: :all_blank
  accepts_nested_attributes_for :patient, allow_destroy: true, update_only: true, reject_if: :all_blank

  validates :patient, presence: true
  validates :receipt_date, presence: true
  validates :reason, presence: true
  validates :discharge_date, presence: true
  validates :discharge_epicrisis, presence: true
  validates :ward, presence: true

end
