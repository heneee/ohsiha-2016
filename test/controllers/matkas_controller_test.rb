require 'test_helper'

class MatkasControllerTest < ActionController::TestCase
  setup do
    @matka = matkas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matkas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matka" do
    assert_difference('Matka.count') do
      post :create, matka: { kulkuneuvo: @matka.kulkuneuvo, lahto: @matka.lahto, lisatietoja: @matka.lisatietoja, matkaseurue: @matka.matkaseurue, mihin: @matka.mihin, mista: @matka.mista, paluu: @matka.paluu }
    end

    assert_redirected_to matka_path(assigns(:matka))
  end

  test "should show matka" do
    get :show, id: @matka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matka
    assert_response :success
  end

  test "should update matka" do
    patch :update, id: @matka, matka: { kulkuneuvo: @matka.kulkuneuvo, lahto: @matka.lahto, lisatietoja: @matka.lisatietoja, matkaseurue: @matka.matkaseurue, mihin: @matka.mihin, mista: @matka.mista, paluu: @matka.paluu }
    assert_redirected_to matka_path(assigns(:matka))
  end

  test "should destroy matka" do
    assert_difference('Matka.count', -1) do
      delete :destroy, id: @matka
    end

    assert_redirected_to matkas_path
  end
end
