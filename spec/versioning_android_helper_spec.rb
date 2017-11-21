require 'spec_helper'

describe Fastlane::Helper::VersioningAndroidHelper do
  describe "Versioning Android Helper" do
    it "should return path to build.gradle" do
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file(nil)
      expect(result).to eq(Fastlane::Helper::VersioningAndroidHelper::GRADLE_FILE_TEST)
    end

    it "should return absolute path to build.gradle" do
      xcodeproj = Fastlane::Helper::VersioningAndroidHelper::GRADLE_FILE_TEST
      result = Fastlane::Helper::VersioningAndroidHelper.get_gradle_file_path(xcodeproj)
      expect(result).to eq("/tmp/fastlane/tests/versioning/app/build.gradle")
    end
  end
end
