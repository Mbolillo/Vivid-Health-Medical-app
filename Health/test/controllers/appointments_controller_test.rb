require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { appointment_date: @appointment.appointment_date, appointment_time: @appointment.appointment_time, doctor_id: @appointment.doctor_id, patient_id: @appointment.patient_id, payment_id: @appointment.payment_id, status: @appointment.status, total_hours: @appointment.total_hours } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { appointment_date: @appointment.appointment_date, appointment_time: @appointment.appointment_time, doctor_id: @appointment.doctor_id, patient_id: @appointment.patient_id, payment_id: @appointment.payment_id, status: @appointment.status, total_hours: @appointment.total_hours } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end