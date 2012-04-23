$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'wordpress'
require 'rspec'
require 'webmock/rspec'
#require 'vcr'

#VCR.config do |c|
#  c.cassette_library_dir     = 'spec/fixtures/cassette_library'
#  c.stub_with                :webmock
#  c.ignore_localhost         = true
#  c.default_cassette_options = { :record => :none }
#end

#RSpec.configure do |c|
#  c.extend VCR::RSpec::Macros
#end

def wordpress_url(url)
  url =~ /^http/ ? url : "https://public-api.wordpress.com#{url}"
end

