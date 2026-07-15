require 'test_helper'

class Mitlibraries::EngineTest < ActiveSupport::TestCase
  test 'registers theme assets for precompilation' do
    expected_assets = %w[
      favicon.ico
      mitlib-wordmark.svg
      vi-shape7-tp.svg
      libraries-main.css
    ]

    assert_equal expected_assets, expected_assets & Rails.application.config.assets.precompile
  end

  test 'makes theme assets available to the asset pipeline' do
    assert_equal 'libraries-main.css', Rails.application.assets.find_asset('libraries-main.css').logical_path
    assert_equal 'favicon.ico', Rails.application.assets.find_asset('favicon.ico').logical_path
  end
end
