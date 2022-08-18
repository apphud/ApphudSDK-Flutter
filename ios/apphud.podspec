#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appHud.podspec' to validate before publishing.
#

begin
    require 'yaml'
    pubspec = YAML.load_file('../pubspec.yaml')
    flutterSdkVersion = pubspec['version']
rescue
    flutterSdkVersion = '0.0.1'
end

Pod::Spec.new do |s|
  s.name             = 'apphud'
  s.version          = flutterSdkVersion
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ApphudSDK','2.8.6'
  s.platform = :ios, '11.2'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end