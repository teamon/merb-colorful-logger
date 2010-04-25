require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "merb-colorful-logger"
    gemspec.summary = gemspec.description = "Merb plugin that provides some color to merb console"
    gemspec.email = "i@teamon.eu"
    gemspec.homepage = "http://github.com/teamon/merb-colorful-logger"
    gemspec.authors = ["Tymon Tobolski"]
    gemspec.add_dependency('merb-core', '>= 1.0')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

desc "Run specs"
task :spec do
  system("spec -O spec/spec.opts spec")
end