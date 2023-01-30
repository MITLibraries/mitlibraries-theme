require 'test_helper'

class LinkHelperTest < ActionView::TestCase
  test 'nav_link_to denotes links to current page' do
    target_url = '/'
    expected = '<a class="nav-item current" aria-current="page" href="/">Home</a>'
    assert current_page?(target_url)
    assert_equal expected, nav_link_to('Home', '/')
  end

  test 'nav_link_to links to arbitrary page' do
    target_url = '/foo'
    expected = '<a class="nav-item" href="/foo">Foo</a>'
    refute current_page?(target_url)
    assert_equal expected, nav_link_to('Foo', '/foo')
  end
end
