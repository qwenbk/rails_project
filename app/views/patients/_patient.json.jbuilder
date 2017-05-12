json.extract! patient, :id, :second_name, :first_name, :last_name, :number, :number_polis, :is_platnik, :data_created, :index, :town, :street, :house, :corpus, :flat, :telefone, :seria, :nomer, :date_of_issue, :allergy, :created_at, :updated_at
json.url patient_url(patient, format: :json)
