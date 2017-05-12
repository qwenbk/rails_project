require 'test_helper'

class HospitalStayListsControllerTest < ActionController::TestCase
  setup do
    @hospital_stay_list = hospital_stay_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospital_stay_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital_stay_list" do
    assert_difference('HospitalStayList.count') do
      post :create, hospital_stay_list: { discharge_date: @hospital_stay_list.discharge_date, discharge_epicrisis: @hospital_stay_list.discharge_epicrisis, patient_id: @hospital_stay_list.patient_id, reason: @hospital_stay_list.reason, receipt_date: @hospital_stay_list.receipt_date, ward_id: @hospital_stay_list.ward_id }
    end

    assert_redirected_to hospital_stay_list_path(assigns(:hospital_stay_list))
  end

  test "should show hospital_stay_list" do
    get :show, id: @hospital_stay_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hospital_stay_list
    assert_response :success
  end

  test "should update hospital_stay_list" do
    patch :update, id: @hospital_stay_list, hospital_stay_list: { discharge_date: @hospital_stay_list.discharge_date, discharge_epicrisis: @hospital_stay_list.discharge_epicrisis, patient_id: @hospital_stay_list.patient_id, reason: @hospital_stay_list.reason, receipt_date: @hospital_stay_list.receipt_date, ward_id: @hospital_stay_list.ward_id }
    assert_redirected_to hospital_stay_list_path(assigns(:hospital_stay_list))
  end

  test "should destroy hospital_stay_list" do
    assert_difference('HospitalStayList.count', -1) do
      delete :destroy, id: @hospital_stay_list
    end

    assert_redirected_to hospital_stay_lists_path
  end
end
