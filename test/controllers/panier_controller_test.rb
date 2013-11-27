require 'test_helper'

class PanierControllerTest < ActionController::TestCase
  test "should get ajouter" do
    get :ajouter
    assert_response :success
  end

end
