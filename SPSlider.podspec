#
# Be sure to run `pod lib lint SPSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SPSlider'
  s.version          = '0.1.0'
  s.summary          = 'Look alike iOS slider.'

  s.description      = 'This pod provides look alike iOS slider.'

  s.homepage         = 'https://github.com/ChaseStas/SPSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Stanislau Parechyn' => 'stasparechin@icloud.com' }
  s.source           = { :git => 'https://github.com/ChaseStas/SPSlider.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SPSlider/Classes/**/*'
  s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'SPSlider' => ['SPSlider/Assets/*.png']
  # }
end
