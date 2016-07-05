require 'test_helper'

class RubriquesControllerTest < ActionController::TestCase
  setup do
    @rubrique = rubriques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rubriques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rubrique" do
    assert_difference('Rubrique.count') do
      post :create, rubrique: { body: @rubrique.body, titre: @rubrique.titre }
    end

    assert_redirected_to rubrique_path(assigns(:rubrique))
  end

  test "should show rubrique" do
    get :show, id: @rubrique
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rubrique
    assert_response :success
  end

  test "should update rubrique" do
    patch :update, id: @rubrique, rubrique: { body: @rubrique.body, titre: @rubrique.titre }
    assert_redirected_to rubrique_path(assigns(:rubrique))
  end

  test "should destroy rubrique" do
    assert_difference('Rubrique.count', -1) do
      delete :destroy, id: @rubrique
    end

    assert_redirected_to rubriques_path
  end
end
