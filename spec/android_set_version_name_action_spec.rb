require 'spec_helper'

describe Fastlane::Actions::AndroidSetVersionNameAction do
  describe "Set Version Name (Groovy)" do
    before do
      copy_groovy_project_files_fixture
    end

    it "should set Version Name to specific value" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "2.34.5")
      end').runner.execute(:test)
      expect(result).to eq("2.34.5")
    end

    it "should set Version Name to ANDROID_NEW_VERSION_NAME shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "2.34.5")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("2.34.5")
    end

    after do
      remove_project_files_fixture
    end
  end

  describe "Set Version Name (Kotlin)" do
    before do
      copy_kotlin_project_files_fixture
    end

    it "should set Version Name to specific value" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "5.67.8")
      end').runner.execute(:test)
      expect(result).to eq("5.67.8")
    end

    it "should set Version Name to ANDROID_NEW_VERSION_NAME shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "5.67.8")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("5.67.8")
    end

    after do
      remove_project_files_fixture
    end
  end
end
