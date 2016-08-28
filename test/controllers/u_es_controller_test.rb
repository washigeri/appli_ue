require 'test_helper'

class UEsControllerTest < ActionController::TestCase
  setup do
    @ue = ues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ue" do
    assert_difference('Ue.count') do
      post :create, ues: {description: @ue.description, lieu: @ue.lieu, titre: @ue.titre, type: @ue.type }
    end

    assert_redirected_to ue_path(assigns(:ues))
  end

  test "should show ue" do
    get :show, id: @ue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ue
    assert_response :success
  end

  test "should update ue" do
    patch :update, id: @ue, ues: {description: @ue.description, lieu: @ue.lieu, titre: @ue.titre, type: @ue.type }
    assert_redirected_to ue_path(assigns(:ues))
  end

  test "should destroy ue" do
    assert_difference('Ue.count', -1) do
      delete :destroy, id: @ue
    end

    assert_redirected_to ues_path
  end
end
