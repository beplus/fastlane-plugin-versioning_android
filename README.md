# versioning_android plugin

[![Build Status](https://travis-ci.org/beplus/fastlane-plugin-versioning_android.svg?branch=master)](https://travis-ci.org/beplus/fastlane-plugin-versioning_android)
[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-versioning_android)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-versioning_android`, add it to your project by running:

```bash
fastlane add_plugin versioning_android
```

## About versioning_android

Android Versioning Plugin for Fastlane - easily Get / Set `versionCode` and `versionName` on your Android project.

**Note**: If you need to work with `Build Number` and `Version` on iOS, see [versioning_ios](https://github.com/beplus/fastlane-plugin-versioning_ios)

### Available actions
- `android_get_version_code` to get the Version Code
- `android_get_version_name` to get the Version Name
- `android_set_version_code` to set the new Version Code
- `android_set_version_name` to set the new Version Name

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

### Example project

**@todo** You can find a fully functional setup of this plugin in the [UdemyFastlane](https://github.com/igorlamos/udemy-fastlane) repo, where you can also find more info about versioning of Android apps.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
