#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appHud.podspec' to validate before publishing.
#

Pod::Spec.new do |s|
  s.name             = 'apphud'
  s.version          = '2.7.2'
  s.summary          = 'Apphud SDK flutter plugin.'
  s.description      = <<-DESC
Apphud SDK flutter plugin.
                       DESC
  s.homepage         = 'https://apphud.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Apphud' => 'support@apphud.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ApphudSDK','3.6.2'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.9'
end
