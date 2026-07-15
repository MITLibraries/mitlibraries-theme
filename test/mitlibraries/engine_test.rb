require 'test_helper'

class Mitlibraries::EngineTest < ActiveSupport::TestCase
  test 'registers theme assets for precompilation' do
    expected_assets = %w[
      favicon.ico
      libraries-main.css
    ]

    assert_equal expected_assets, expected_assets & Rails.application.config.assets.precompile
  end

  test 'makes theme assets available to the asset pipeline' do
    libraries_css = Rails.application.assets&.find_asset('libraries-main.css')
    favicon = Rails.application.assets&.find_asset('favicon.ico')

    refute_nil libraries_css, "Expected sprockets to find libraries-main.css"
    refute_nil favicon, "Expected sprockets to find favicon.ico"

    assert_equal 'libraries-main.css', libraries_css.logical_path
    assert_equal 'favicon.ico', favicon.logical_path
  end
end
