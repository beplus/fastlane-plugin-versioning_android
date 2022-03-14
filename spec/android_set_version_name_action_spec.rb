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

    it "should bump the Version Name by 1 patch version when bump_type patch is set" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "2.34.5", bump_type: "patch")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("2.34.6")
    end

    it "should bump the Version Name by 1 minor version when bump_type minor is set" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "2.34.5", bump_type: "minor")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("2.35.0")
    end

    it "should bump the Version Name by 1 major version when bump_type major is set" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(version_name: "2.34.5", bump_type: "major")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("3.0.0")
    end

    it "should use the default gradle path when no version name is provided" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name()
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("1.23.4")
    end

    it "should bump version name using the default gradle path when no version name is provided" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_name(bump_type: "patch")
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_NAME]).to eq("1.23.5")
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
