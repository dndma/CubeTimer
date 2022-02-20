require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should register new user' do
    get '/'
    assert_response :success

    post '/users', params: { user: { email: 'test@rtv.org', password: 123345, password_confirmation: 123345 }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h6', 'Cuber email: test@rtv.org'
  end

end


