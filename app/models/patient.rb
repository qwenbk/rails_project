class Patient < ActiveRecord::Base
  has_many :hospital_stay_lists, inverse_of: :patient, dependent: :destroy

  validates :second_name, presence: true
  validates :first_name, presence: true
  validates :number, presence: true
  validates :number_polis, presence: true
  validates :data_created, presence: true
  validates :index, presence: true
  validates :town, presence: true
  validates :house, presence: true
  validates :seria, presence: true, uniqueness: { scope: :number ,message: "Пациент с такими данными как серия и номер паспорта уже существует!" }
  validates :nomer, presence: true
  validates :issued_by, presence: true
  validates :date_of_issue, presence: true
  validates :allergy, presence: true
end
