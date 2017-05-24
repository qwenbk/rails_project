class Patient < ActiveRecord::Base
  has_many :hospital_stay_lists, inverse_of: :patient, dependent: :destroy
  has_many :wards, through: :hospital_stay_lists

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

  def self.search(params)
    result = Patient.includes(:hospital_stay_lists, :wards)
    # по пациенту
    if params[:second_name].present?
     result = result.where("second_name ilike ?", params[:second_name].to_s)
    end
    if params[:first_name].present?
     result = result.where("first_name ilike ?", params[:first_name].to_s)
    end
    if params[:last_name].present?
     result = result.where("last_name ilike ?", params[:last_name].to_s)
    end
    if params[:number].present?
     result = result.where("patients.number ilike ?", params[:number].to_s)
    end
    if params[:number_polis].present?
     result = result.where("number_polis ilike ?", params[:number_polis].to_s)
    end
    if params[:is_platnik].present?
     result = result.where("is_platnik = ?", params[:is_platnik].to_s)
    end
    if params[:data_created_from].present? && params[:data_created_to].present?
      result = result.where("data_created BETWEEN ? AND ?", params[:data_created_from], params[:data_created_to])
    end
    if params[:index].present?
     result = result.where("index ilike ?", params[:index].to_s)
    end
    if params[:town].present?
     result = result.where("town ilike ?", params[:town].to_s)
    end
    if params[:street].present?
     result = result.where("street ilike ?", params[:street].to_s)
    end
    if params[:house].present?
     result = result.where("house ilike ?", params[:house].to_s)
    end
    if params[:corpus].present?
     result = result.where("corpus ilike ?", params[:corpus].to_s)
    end
    if params[:flat].present?
     result = result.where("flat ilike ?", params[:flat].to_s)
    end
    if params[:telefone].present?
     result = result.where("telefone ilike ?", params[:telefone].to_s)
    end
    if params[:issued_by].present?
     result = result.where("issued_by ilike ?", params[:issued_by].to_s)
    end
    if params[:seria].present?
     result = result.where("seria ilike ?", params[:seria].to_s)
    end
    if params[:nomer].present?
     result = result.where("nomer = ?", params[:nomer].to_s)
    end
    if params[:date_of_issue_from].present? && params[:date_of_issue_to].present?
      result = result.where("date_of_issue BETWEEN ? AND ?", params[:date_of_issue_from], params[:date_of_issue_to])
    end
    if params[:allergy].present?
      result = result.where("allergy ilike ?", params[:allergy].to_s)
    end

    # амбулаторки
    if params[:receipt_date_from].present? && params[:receipt_date_to].present?
      result=result.references(:hospital_stay_lists)
      result = result.where("hospital_stay_lists.receipt_date BETWEEN ? AND ?", params[:receipt_date_from], params[:receipt_date_to])
    end
    if params[:reason].present?
      result=result.references(:hospital_stay_lists)
      result = result.where("hospital_stay_lists.reason ilike ?", params[:reason].to_s)
    end
    if params[:discharge_epicrisis].present?
      result=result.references(:hospital_stay_lists)
      result = result.where("hospital_stay_lists.discharge_epicrisis ilike ?", params[:discharge_epicrisis].to_s)
    end
    if params[:discharge_date_from].present? && params[:discharge_date_to].present?
      result=result.references(:hospital_stay_lists)
      result = result.where("hospital_stay_lists.discharge_date BETWEEN ? AND ?", params[:discharge_date_from], params[:discharge_date_to])
    end

    # палаты
    if params[:floor].present?
      result=result.references(:wards)
      result = result.where("wards.floor = ?", params[:floor].to_s)
    end
    if params[:number1].present?
      result=result.references(:wards)
      result = result.where("wards.number ilike ?", params[:number1].to_s)
    end
    if params[:departmen].present?
      result=result.references(:wards)
      result = result.where("wards.departmen ilike ?", params[:departmen].to_s)
    end
    if params[:capacity].present?
      result=result.references(:wards)
      result = result.where("wards.capacity = ?", params[:capacity].to_s)
    end

  result.all.uniq
  end
end
