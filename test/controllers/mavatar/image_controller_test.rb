require 'test_helper'

module Mavatar
  class ImageControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
