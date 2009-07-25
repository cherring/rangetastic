# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rangetastic}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Herring"]
  s.date = %q{2009-07-25}
  s.description = %q{Chain a date range to any named_scope on any date field with specified white listed fields}
  s.email = %q{chris.herring.iphone@gmail.com}
  s.extra_rdoc_files = ["lib/rangetastic.rb", "README.markdown"]
  s.files = ["lib/rangetastic.rb", "Manifest", "MIT-License", "Rakefile", "rangetastic.gemspec", "README.markdown", "spec/fixtures/models.rb", "spec/fixtures/structure.sql", "spec/rangetastic_spec.rb", "spec/spec_helper.rb", "spec/test_helper.rb"]
  s.homepage = %q{http://github.com/cherring/rangetastic}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rangetastic", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rangetastic}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Chain a date range to any named_scope on any date field with specified white listed fields}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
