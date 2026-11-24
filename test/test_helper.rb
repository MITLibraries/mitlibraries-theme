# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "simplecov"
require "simplecov-lcov"

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov::Formatter::LcovFormatter.config.lcov_file_name = "coverage.lcov"
SimpleCov.formatters = [
	SimpleCov::Formatter::HTMLFormatter,
	SimpleCov::Formatter::LcovFormatter
]
SimpleCov.start("rails")

require_relative "../test/dummy/config/environment"
require "rails/test_help"

