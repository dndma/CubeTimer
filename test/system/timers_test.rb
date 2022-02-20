require "application_system_test_case"

class TimersTest < ApplicationSystemTestCase
  test 'should get components of page' do
    visit root_path
    assert_selector 'p', id: 'scramble'
    assert_selector 'div', id: 'visualisation'
    assert_selector 'p', id: 'ptime'
    assert_selector 'input', id: 'v1'
    assert_selector 'nav', id: 'nav'
  end

  test 'should check correctness of solve saving' do
    visit root_path
    fill_in :v1, with: 12.3
    click_on 'Add'
    visit '/timer/solves'
    assert_selector 'h2', id: 'num'
    assert_selector 'span', id: 'num'

    visit root_path
    fill_in :v1, with: ''
    click_on 'Add'
    visit '/timer/solves'
    assert_selector 'h2', id: 'num'
    assert_selector 'div'
    assert_no_selector 'div:nth-child(2)'
  end

  test 'should log in user' do
    visit '/users/sign_in'
    fill_in "Email", with: 'timur@cube.ru'
    fill_in "Password", with: 123456
    click_on 'log in'
    visit '/'
    assert_selector 'h6', text: 'Cuber email: timur@cube.ru'
  end


end
