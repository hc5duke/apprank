# load path for ruby 2.x
$:<< File.join(File.dirname(__FILE__), '..')

require 'lib/apprank'
include Apprank

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

module SpecHelper
  def self.data
    open('./spec/fixtures/data.json')
  end
end
