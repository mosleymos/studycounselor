require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school" do
    assert_difference('School.count') do
      post :create, school: { description: @school.description, first_letter: @school.first_letter, goals: @school.goals, image_url: @school.image_url, name: @school.name, research_name: @school.research_name, school_url: @school.school_url, slug: @school.slug }
    end

    assert_redirected_to school_path(assigns(:school))
  end

  test "should show school" do
    get :show, id: @school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school
    assert_response :success
  end

  test "should update school" do
    patch :update, id: @school, school: { description: @school.description, first_letter: @school.first_letter, goals: @school.goals, image_url: @school.image_url, name: @school.name, research_name: @school.research_name, school_url: @school.school_url, slug: @school.slug }
    assert_redirected_to school_path(assigns(:school))
  end

  test "should destroy school" do
    assert_difference('School.count', -1) do
      delete :destroy, id: @school
    end

    assert_redirected_to schools_path
  end
end
