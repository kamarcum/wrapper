require "rubygems"
require "bundler/setup"
require 'active_support/core_ext'
require 'pry'

require 'wrapper'

Dir.glob("spec/{models,presenters}/*").each { |file| require File.expand_path file }

RSpec.configure do |config|
end
