require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  test "should get set_year" do
    get :set_year
    assert_response :success
  end

end
