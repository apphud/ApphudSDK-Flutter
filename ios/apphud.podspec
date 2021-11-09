#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint appHud.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'apphud'
  s.version          = '2.1.3'
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
  s.dependency 'ApphudSDK','2.4.4'
  s.platform = :ios, '11.2'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.preserve_paths = 'set_flutter_sdk_version.rb'
  
  s.script_phase = {
    :name => 'Set Flutter SDK version',
    :execution_position => :before_compile,
    :shell_path => '/usr/bin/ruby',
    :script => %{
            require 'json'
            require 'yaml'
            file = File.read('../../.dart_tool/package_config.json')
            config = JSON.parse(file)
            package = config['packages'].detect {|e| e['name'] == 'apphud'}
            path = package['rootUri'].gsub 'file://', ''
            if path == '../../'
                  path = '../../../'
            end
            pubspec = YAML.load_file(path + '/pubspec.yaml')
            puts pubspec['version']
        }
    }
end
