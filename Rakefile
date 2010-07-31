$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "bundler/version"
require "shoulda/tasks"
require 'lib/google_places'

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.ruby_opts = ["-rubygems"] if defined? Gem
  test.libs << "lib" << "test"
  test.pattern = "test/**/*_test.rb"
end

task :default => :test

# We'll be ready to make a gem when the time is right
# begin
#   require 'jeweler'
#   Jeweler::Tasks.new do |gem|
#     gem.name = "google_places"
#     gem.summary = %Q{Ruby wrapper for the Google Places API}
#     gem.description = %Q{Ruby wrapper for the Google Places API}
#     gem.email = "johnnyn@gmail.com"
#     gem.homepage = "http://github.com/phuphighter/google_places"
#     gem.authors = ["Johnny Khai Nguyen"]
#     
#     gem.add_dependency('httparty', '>= 0.5.0')
#     gem.add_dependency('hashie', '>= 0.2.0')
#     gem.add_dependency('ruby-hmac', '>= 0.4.0')
#   end
#   Jeweler::GemcutterTasks.new
# rescue LoadError
#   puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
# end