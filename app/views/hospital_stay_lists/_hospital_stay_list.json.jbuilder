json.extract! hospital_stay_list, :id, :patient_id, :receipt_date, :reason, :discharge_date, :discharge_epicrisis, :ward_id, :created_at, :updated_at
json.url hospital_stay_list_url(hospital_stay_list, format: :json)
