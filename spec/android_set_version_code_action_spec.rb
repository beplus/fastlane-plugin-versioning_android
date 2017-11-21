require 'spec_helper'

describe Fastlane::Actions::AndroidSetVersionCodeAction do
  describe "Set Version Code" do
    before do
      copy_project_files_fixture
    end

    it "should increment Version Code and return its new value" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_set_version_code
      end').runner.execute(:test)
      expect(result).to eq(18)
    end

    it "should set incremented Version Code to ANDROID_NEW_VERSION_CODE shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_code
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_CODE]).to eq(18)
    end

    it "should set specific Version Code and return its new value" do
      result = Fastlane::FastFile.new.parse('lane :test do
        android_set_version_code(version_code: 17)
      end').runner.execute(:test)
      expect(result).to eq(17)
    end

    it "should set specific Version Code to ANDROID_NEW_VERSION_CODE shared value" do
      Fastlane::FastFile.new.parse('lane :test do
        android_set_version_code(version_code: 17)
      end').runner.execute(:test)
      expect(Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::ANDROID_NEW_VERSION_CODE]).to eq(17)
    end

    after do
      remove_project_files_fixture
    end
  end
end
