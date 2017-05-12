require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { allergy: @patient.allergy, corpus: @patient.corpus, data_created: @patient.data_created, date_of_issue: @patient.date_of_issue, first_name: @patient.first_name, flat: @patient.flat, house: @patient.house, index: @patient.index, is_platnik: @patient.is_platnik, last_name: @patient.last_name, nomer: @patient.nomer, number: @patient.number, number_polis: @patient.number_polis, second_name: @patient.second_name, seria: @patient.seria, street: @patient.street, telefone: @patient.telefone, town: @patient.town }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { allergy: @patient.allergy, corpus: @patient.corpus, data_created: @patient.data_created, date_of_issue: @patient.date_of_issue, first_name: @patient.first_name, flat: @patient.flat, house: @patient.house, index: @patient.index, is_platnik: @patient.is_platnik, last_name: @patient.last_name, nomer: @patient.nomer, number: @patient.number, number_polis: @patient.number_polis, second_name: @patient.second_name, seria: @patient.seria, street: @patient.street, telefone: @patient.telefone, town: @patient.town }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
