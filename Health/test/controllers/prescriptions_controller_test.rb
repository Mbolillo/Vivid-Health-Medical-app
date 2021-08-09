require 'test_helper'

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prescription = prescriptions(:one)
  end

  test "should get index" do
    get prescriptions_url
    assert_response :success
  end

  test "should get new" do
    get new_prescription_url
    assert_response :success
  end

  test "should create prescription" do
    assert_difference('Prescription.count') do
      post prescriptions_url, params: { prescription: { Dose1: @prescription.Dose1, Dose2: @prescription.Dose2, Frecuency1: @prescription.Frecuency1, Frecuency2: @prescription.Frecuency2, Medication1: @prescription.Medication1, Medication2: @prescription.Medication2, Quantity1: @prescription.Quantity1, Quantity2: @prescription.Quantity2, doctor_id: @prescription.doctor_id, patient_id: @prescription.patient_id } }
    end

    assert_redirected_to prescription_url(Prescription.last)
  end

  test "should show prescription" do
    get prescription_url(@prescription)
    assert_response :success
  end

  test "should get edit" do
    get edit_prescription_url(@prescription)
    assert_response :success
  end

  test "should update prescription" do
    patch prescription_url(@prescription), params: { prescription: { Dose1: @prescription.Dose1, Dose2: @prescription.Dose2, Frecuency1: @prescription.Frecuency1, Frecuency2: @prescription.Frecuency2, Medication1: @prescription.Medication1, Medication2: @prescription.Medication2, Quantity1: @prescription.Quantity1, Quantity2: @prescription.Quantity2, doctor_id: @prescription.doctor_id, patient_id: @prescription.patient_id } }
    assert_redirected_to prescription_url(@prescription)
  end

  test "should destroy prescription" do
    assert_difference('Prescription.count', -1) do
      delete prescription_url(@prescription)
    end

    assert_redirected_to prescriptions_url
  end
end
