# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

target 'Babysafe Home AR iOS SwiftUI' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Babysafe Home AR iOS SwiftUI
  pod 'TFLiteSwift-Vision', '~> 0.2.6'

end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end


# pod installieren wie in https://github.com/CocoaPods/CocoaPods/issues/10287#issuecomment-902354887