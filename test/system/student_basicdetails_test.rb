require "application_system_test_case"

class StudentBasicdetailsTest < ApplicationSystemTestCase
  setup do
    @student_basicdetail = student_basicdetails(:one)
  end

  test "visiting the index" do
    visit student_basicdetails_url
    assert_selector "h1", text: "Student Basicdetails"
  end

  test "creating a Student basicdetail" do
    visit student_basicdetails_url
    click_on "New Student Basicdetail"

    click_on "Create Student basicdetail"

    assert_text "Student basicdetail was successfully created"
    click_on "Back"
  end

  test "updating a Student basicdetail" do
    visit student_basicdetails_url
    click_on "Edit", match: :first

    click_on "Update Student basicdetail"

    assert_text "Student basicdetail was successfully updated"
    click_on "Back"
  end

  test "destroying a Student basicdetail" do
    visit student_basicdetails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student basicdetail was successfully destroyed"
  end
end
