require "test_helper"

class StudentsDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_detail = students_details(:one)
  end

  test "should get index" do
    get students_details_url
    assert_response :success
  end

  test "should get new" do
    get new_students_detail_url
    assert_response :success
  end

  test "should create students_detail" do
    assert_difference('StudentsDetail.count') do
      post students_details_url, params: { students_detail: { age: @students_detail.age, gender: @students_detail.gender, name: @students_detail.name } }
    end

    assert_redirected_to students_detail_url(StudentsDetail.last)
  end

  test "should show students_detail" do
    get students_detail_url(@students_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_students_detail_url(@students_detail)
    assert_response :success
  end

  test "should update students_detail" do
    patch students_detail_url(@students_detail), params: { students_detail: { age: @students_detail.age, gender: @students_detail.gender, name: @students_detail.name } }
    assert_redirected_to students_detail_url(@students_detail)
  end

  test "should destroy students_detail" do
    assert_difference('StudentsDetail.count', -1) do
      delete students_detail_url(@students_detail)
    end

    assert_redirected_to students_details_url
  end
end
