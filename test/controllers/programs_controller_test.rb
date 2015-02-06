require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  setup do
    @program = programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post :create, program: { description: @program.description, equivalent_year: @program.equivalent_year, first_letter: @program.first_letter, name: @program.name, prerequisites: @program.prerequisites, program_duration: @program.program_duration, program_image_url: @program.program_image_url, program_url: @program.program_url, research_name: @program.research_name, school_id: @program.school_id, slug: @program.slug }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  test "should show program" do
    get :show, id: @program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    patch :update, id: @program, program: { description: @program.description, equivalent_year: @program.equivalent_year, first_letter: @program.first_letter, name: @program.name, prerequisites: @program.prerequisites, program_duration: @program.program_duration, program_image_url: @program.program_image_url, program_url: @program.program_url, research_name: @program.research_name, school_id: @program.school_id, slug: @program.slug }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    assert_difference('Program.count', -1) do
      delete :destroy, id: @program
    end

    assert_redirected_to programs_path
  end
end
