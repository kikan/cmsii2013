require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @categorie = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorie" do
    assert_difference('Categorie.count') do
      post :create, categorie: { fichier_image: @categorie.fichier_image, libelle: @categorie.libelle }
    end

    assert_redirected_to categorie_path(assigns(:categorie))
  end

  test "should show categorie" do
    get :show, id: @categorie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categorie
    assert_response :success
  end

  test "should update categorie" do
    patch :update, id: @categorie, categorie: { fichier_image: @categorie.fichier_image, libelle: @categorie.libelle }
    assert_redirected_to categorie_path(assigns(:categorie))
  end

  test "should destroy categorie" do
    assert_difference('Categorie.count', -1) do
      delete :destroy, id: @categorie
    end

    assert_redirected_to categories_path
  end
end
