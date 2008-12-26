# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-colorful-logger}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tymon <teamon> Tobolski"]
  s.date = %q{2008-12-26}
  s.description = %q{Merb plugin that provides some color to merb console}
  s.email = %q{i@teamon.eu}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "lib/merb-colorful-logger.rb", "spec/merb-colorful-logger_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://teamon.eu/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{merb}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Merb plugin that provides some color to merb console}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb>, [">= 1.0"])
    else
      s.add_dependency(%q<merb>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<merb>, [">= 1.0"])
  end
end
