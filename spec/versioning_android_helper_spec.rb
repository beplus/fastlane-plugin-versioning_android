require 'spec_helper'

describe Fastlane::Helper::VersioningAndroidHelper do
  describe "Versioning Android Helper (Groovy)" do
    it "should return path to build.gradle" do
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file(nil)
      expect(result).to eq(Fastlane::Helper::VersioningAndroidHelper::DEFAULT_GROOVY_GRADLE_FILE)
    end

    it "should return absolute path to build.gradle" do
      gradle_file = Fastlane::Helper::VersioningAndroidHelper::DEFAULT_GROOVY_GRADLE_FILE
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file_path(gradle_file)
      expect(result).to eq File.expand_path("./app/build.gradle")
    end
  end

  describe "Versioning Android Helper (Kotlin)" do
    before do
      FileUtils.mkdir_p("./app")
      source = "./spec/fixtures/app/build.gradle.kts"
      destination = "./app/build.gradle.kts"
      FileUtils.copy_file(source, destination)
    end

    it "should return path to build.gradle.kts" do
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file(nil)
      expect(result).to eq(Fastlane::Helper::VersioningAndroidHelper::DEFAULT_KOTLIN_GRADLE_FILE)
    end

    it "should return absolute path to build.gradle.kts" do
      gradle_file = Fastlane::Helper::VersioningAndroidHelper::DEFAULT_KOTLIN_GRADLE_FILE
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file_path(gradle_file)
      expect(result).to eq File.expand_path("./app/build.gradle.kts")
    end

    after do
      FileUtils.rm_rf("./app")
    end
  end
end
