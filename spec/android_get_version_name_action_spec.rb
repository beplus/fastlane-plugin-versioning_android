require 'spec_helper'

describe Fastlane::Actions::AndroidGetVersionNameAction do
  describe "Get Version Name" do
    before do
      copy_project_files_fixture
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
end
