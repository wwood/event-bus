$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'aruba/cucumber'
require 'simplecov'
SimpleCov.command_name 'cucumber'
SimpleCov.start

# Pull in all of the gems including those in the `test` group
require 'bundler'
Bundler.require :default, :test, :development

ENV['TEST'] = 'true'
