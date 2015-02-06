require 'test_helper'

class CounselorsControllerTest < ActionController::TestCase
  setup do
    @counselor = counselors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:counselors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create counselor" do
    assert_difference('Counselor.count') do
      post :create, counselor: { adress: @counselor.adress, approved_by_administrator: @counselor.approved_by_administrator, birthdate: @counselor.birthdate, cursus: @counselor.cursus, first_name: @counselor.first_name, general_comment: @counselor.general_comment, last_name: @counselor.last_name, mail: @counselor.mail, slug: @counselor.slug, telephone: @counselor.telephone }
    end

    assert_redirected_to counselor_path(assigns(:counselor))
  end

  test "should show counselor" do
    get :show, id: @counselor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @counselor
    assert_response :success
  end

  test "should update counselor" do
    patch :update, id: @counselor, counselor: { adress: @counselor.adress, approved_by_administrator: @counselor.approved_by_administrator, birthdate: @counselor.birthdate, cursus: @counselor.cursus, first_name: @counselor.first_name, general_comment: @counselor.general_comment, last_name: @counselor.last_name, mail: @counselor.mail, slug: @counselor.slug, telephone: @counselor.telephone }
    assert_redirected_to counselor_path(assigns(:counselor))
  end

  test "should destroy counselor" do
    assert_difference('Counselor.count', -1) do
      delete :destroy, id: @counselor
    end

    assert_redirected_to counselors_path
  end
end
