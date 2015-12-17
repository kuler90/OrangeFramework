#
# Be sure to run `pod lib lint OrangeFramework.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = "OrangeFramework"
  s.version          = "0.1.0"
  s.summary          = "OrangeFramework is a collection of tools for iOS development aimed at fast and high quality coding on Swift and Objective C."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       DESC

  s.homepage         = "https://github.com/kuler90/OrangeFramework"
  s.license          = 'MIT'
  s.author           = { "Roman Kulesha" => "kulesha.r@gmail.com" }
  s.source           = { :git => "https://github.com/kuler90/OrangeFramework.git", :tag => s.version.to_s }
  s.default_subspecs = 'Dependency', 'Log', 'Segue', 'Extension'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.xcconfig = { 'SWIFT_INSTALL_OBJC_HEADER' => 'NO', 'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO' }

  s.subspec 'Dependency' do |ss|
    ss.source_files = 'OrangeFramework/Dependency/**/*'
  end

  s.subspec 'Log' do |ss|
    ss.source_files = 'OrangeFramework/Log/**/*'
  end

  s.subspec 'Segue' do |ss|
    ss.source_files = 'OrangeFramework/Segue/**/*'
  end

  s.subspec 'Extension' do |ss|
    ss.source_files = 'OrangeFramework/Extension/**/*'
  end

end
