require 'spec_helper'

describe Fastlane::Actions::AndroidGetVersionNameAction do
  describe "Get Version Name (Groovy)" do
    before do
      copy_groovy_project_files_fixture
    end

    it "should return Version Name from app build.gradle file" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_get_version_name
      end').runner.execute(:test)
      expect(result).to eq("1.23.4")
    end

    it "should set Version Name to ANDROID_VERSION_NAME shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_get_version_name
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_NAME]).to eq("1.23.4")
    end

    after do
      remove_project_files_fixture
    end
  end

  describe "Get Version Name (Kotlin)" do
    before do
      copy_kotlin_project_files_fixture
    end

    it "should return Version Name from app build.gradle.kts file" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_get_version_name
      end').runner.execute(:test)
      expect(result).to eq("3.45.6")
    end

    it "should set Version Name to ANDROID_VERSION_NAME shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_get_version_name
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_NAME]).to eq("3.45.6")
    end

    after do
      remove_project_files_fixture
    end
  end
end
