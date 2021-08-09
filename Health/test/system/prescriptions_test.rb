require "application_system_test_case"

class PrescriptionsTest < ApplicationSystemTestCase
  setup do
    @prescription = prescriptions(:one)
  end

  test "visiting the index" do
    visit prescriptions_url
    assert_selector "h1", text: "Prescriptions"
  end

  test "creating a Prescription" do
    visit prescriptions_url
    click_on "New Prescription"

    fill_in "Dose1", with: @prescription.Dose1
    fill_in "Dose2", with: @prescription.Dose2
    fill_in "Frecuency1", with: @prescription.Frecuency1
    fill_in "Frecuency2", with: @prescription.Frecuency2
    fill_in "Medication1", with: @prescription.Medication1
    fill_in "Medication2", with: @prescription.Medication2
    fill_in "Quantity1", with: @prescription.Quantity1
    fill_in "Quantity2", with: @prescription.Quantity2
    fill_in "Doctor", with: @prescription.doctor_id
    fill_in "Patient", with: @prescription.patient_id
    click_on "Create Prescription"

    assert_text "Prescription was successfully created"
    click_on "Back"
  end

  test "updating a Prescription" do
    visit prescriptions_url
    click_on "Edit", match: :first

    fill_in "Dose1", with: @prescription.Dose1
    fill_in "Dose2", with: @prescription.Dose2
    fill_in "Frecuency1", with: @prescription.Frecuency1
    fill_in "Frecuency2", with: @prescription.Frecuency2
    fill_in "Medication1", with: @prescription.Medication1
    fill_in "Medication2", with: @prescription.Medication2
    fill_in "Quantity1", with: @prescription.Quantity1
    fill_in "Quantity2", with: @prescription.Quantity2
    fill_in "Doctor", with: @prescription.doctor_id
    fill_in "Patient", with: @prescription.patient_id
    click_on "Update Prescription"

    assert_text "Prescription was successfully updated"
    click_on "Back"
  end

  test "destroying a Prescription" do
    visit prescriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prescription was successfully destroyed"
  end
end
