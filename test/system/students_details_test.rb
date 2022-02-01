require "application_system_test_case"

class StudentsDetailsTest < ApplicationSystemTestCase
  setup do
    @students_detail = students_details(:one)
  end

  test "visiting the index" do
    visit students_details_url
    assert_selector "h1", text: "Students Details"
  end

  test "creating a Students detail" do
    visit students_details_url
    click_on "New Students Detail"

    fill_in "Age", with: @students_detail.age
    fill_in "Gender", with: @students_detail.gender
    fill_in "Name", with: @students_detail.name
    click_on "Create Students detail"

    assert_text "Students detail was successfully created"
    click_on "Back"
  end

  test "updating a Students detail" do
    visit students_details_url
    click_on "Edit", match: :first

    fill_in "Age", with: @students_detail.age
    fill_in "Gender", with: @students_detail.gender
    fill_in "Name", with: @students_detail.name
    click_on "Update Students detail"

    assert_text "Students detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Students detail" do
    visit students_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Students detail was successfully destroyed"
  end
end
