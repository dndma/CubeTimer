require "test_helper"

class TimerControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test "check worst solve" do
    get '/', params: { v1: 59.99 }
    assert_response :success
    assert_select 'div#bwc'
    assert_select 'p#worst' do
      assert_select 'p:nth-child(2)', 'Worst: 59.99'
    end
  end

  test "check best solve" do
    get '/', params: { v1: 0.01 }
    assert_response :success
    assert_select 'div#bwc'
    assert_select 'p#best' do
      assert_select 'p:nth-child(1)', 'Best: 00.01'
    end
  end


  test "check count" do
    get '/', params: { v1: 0.01 }
    assert_response :success
    assert_select 'div#bwc'
    assert_select 'p#count' do
      assert_select 'p:nth-child(3)', 'Count: 2'
    end
  end
end
