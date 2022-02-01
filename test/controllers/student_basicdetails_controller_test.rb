require "test_helper"

class StudentBasicdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_basicdetail = student_basicdetails(:one)
  end

  test "should get index" do
    get student_basicdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_student_basicdetail_url
    assert_response :success
  end

  test "should create student_basicdetail" do
    assert_difference('StudentBasicdetail.count') do
      post student_basicdetails_url, params: { student_basicdetail: {  } }
    end

    assert_redirected_to student_basicdetail_url(StudentBasicdetail.last)
  end

  test "should show student_basicdetail" do
    get student_basicdetail_url(@student_basicdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_basicdetail_url(@student_basicdetail)
    assert_response :success
  end

  test "should update student_basicdetail" do
    patch student_basicdetail_url(@student_basicdetail), params: { student_basicdetail: {  } }
    assert_redirected_to student_basicdetail_url(@student_basicdetail)
  end

  test "should destroy student_basicdetail" do
    assert_difference('StudentBasicdetail.count', -1) do
      delete student_basicdetail_url(@student_basicdetail)
    end

    assert_redirected_to student_basicdetails_url
  end
end
