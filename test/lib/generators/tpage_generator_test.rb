require 'test_helper'
require 'generators/tpage/tpage_generator'

class TpageGeneratorTest < Rails::Generators::TestCase
  tests TpageGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
