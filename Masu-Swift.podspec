#
# Be sure to run `pod lib lint Masu.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Masu-Swift"
  s.version          = "0.1.0"
  s.summary          = "Placeholder for iOS prototyping with Swift"
  s.homepage         = "https://github.com/midnightSuyama/Masu-Swift"
  s.screenshots      = "https://raw.githubusercontent.com/midnightSuyama/Masu-Swift/master/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "midnightSuyama" => "midnightSuyama@gmail.com" }
  s.source           = { :git => "https://github.com/midnightSuyama/Masu-Swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
