#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_oewa.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_oewa'
  s.version          = '0.0.1'
  s.summary          = 'A flutter package wrapper around the OEWA Android and iOS SDKs.'
  s.description      = <<-DESC
  A flutter package wrapper around the OEWA Android and iOS SDKs.
                       DESC
  s.homepage         = 'https://marqably.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Simon Auer' => 'simon.auer@marqably.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.preserve_paths = 'INFOnlineLibrary.framework/**/*'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework INFOnlineLibrary' }
  s.vendored_frameworks = 'INFOnlineLibrary.xcframework'
    
  # fix for simulator on intel mac not working
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
