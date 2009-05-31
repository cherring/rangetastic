# Inspiration gained from Thinking Sphinx's test suite.

$:.unshift File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'activerecord'
require 'rangetastic'
require 'spec/fixtures/models'
require 'spec/test_helper'
require 'pg'

FileUtils.mkdir_p "#{Dir.pwd}/tmp"

ActiveRecord::Base.logger = Logger.new(StringIO.new)

Spec::Runner.configure do |config|  
  
  test = TestHelper.new
  test.setup_postgresql
  
end