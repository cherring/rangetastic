require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rangetastic', '0.1.1') do |p|
  p.description     = "Chain a date range to any named_scope on any date field"
	p.url             = "http://github.com/cherring/rangetastic"
	p.author          = "Chris Herring"
	p.email           = "chris.herring.iphone@gmail.com"
	p.ignore_pattern  = ["tmp/*", "script/*"]
	p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
