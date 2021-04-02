require "rspec/expectations"

RSpec::Matchers.define :have_text_in_order do |expected_text|
  match do |page|
    page.text.match(Regexp.new(expected_text.join(".*"), Regexp::MULTILINE))
  end
end
