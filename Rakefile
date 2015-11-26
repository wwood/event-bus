#!/usr/bin/env rake

namespace :gem do
  require 'bundler/gem_tasks'
end

desc 'Default task'
task :default => :test

desc 'Run test suite'
task :test => %w(test:rubocop test:rspec test:cucumber)

namespace :test do
  desc 'Run rspec'
  task :rspec do
    sh 'bundle exec rspec'
  end

  desc 'Run cucumber'
  task :cucumber do
    sh 'bundle exec cucumber'
  end

  desc 'Run cucumber'
  task :rubocop do
    sh 'bundle exec rubocop'
  end
end
