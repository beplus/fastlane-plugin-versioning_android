$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'

# SimpleCov.minimum_coverage 95
SimpleCov.start

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/versioning_android' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def copy_groovy_project_files_fixture
  FileUtils.mkdir_p("./fastlane/app")
  source = "./spec/fixtures/app/build.gradle"
  destination = "./fastlane/app/build.gradle"
  FileUtils.copy_file(source, destination)
end

def copy_kotlin_project_files_fixture
  FileUtils.mkdir_p("./fastlane/app")
  source = "./spec/fixtures/app/build.gradle.kts"
  destination = "./fastlane/app/build.gradle.kts"
  FileUtils.copy_file(source, destination)
end

def remove_project_files_fixture
  FileUtils.rm_rf("./fastlane/app")
end
