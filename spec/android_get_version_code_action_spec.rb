require 'spec_helper'

describe Fastlane::Actions::AndroidGetVersionCodeAction do
  describe "Get Version Code" do
    before do
      copy_project_files_fixture
    end

    it "should return Version Code from app build.gradle file" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_get_version_code
      end').runner.execute(:test)
      expect(result).to eq("17")
    end

    it "should set Version Code to ANDROID_VERSION_CODE shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_get_version_code
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_VERSION_CODE]).to eq("17")
    end

    after do
      remove_project_files_fixture
    end
  end
end
