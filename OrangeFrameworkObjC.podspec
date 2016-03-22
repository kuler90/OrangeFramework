#
# Be sure to run `pod lib lint OrangeFrameworkObjC.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = "OrangeFrameworkObjC"
  s.version          = "1.1.0"
  s.summary          = "Powerful framework aimed at fast and high quality developing mobile apps on Objective-C."
  s.description      = <<-DESC
                       OrangeFramework is a collection of components for fast and high quality developing mobile apps on Objective-C and Swift.
                       It includes a light-weight iOC container, component for detecting running device, powerful extensions and useful segues.
                       DESC
  s.homepage         = "https://github.com/kuler90/OrangeFramework"
  s.license          = 'MIT'
  s.author           = { "Roman Kulesha" => "kulesha.r@gmail.com" }
  s.source           = { :git => "https://github.com/kuler90/OrangeFramework.git", :tag => s.version.to_s }
  s.default_subspecs = 'Dependency', 'Device', 'Extensions', 'Segues'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.deprecated = true

  s.subspec 'Dependency' do |ss|
    ss.source_files = 'Source/Dependency/**/*.{h,m}'
    ss.private_header_files = 'Source/Dependency/**/__OFPrivateServiceLocator.h'
  end

  s.subspec 'Device' do |ss|
    ss.source_files = 'Source/Device/**/*.{h,m}'
  end

  s.subspec 'Extensions' do |ss|
    ss.source_files = 'Source/Extensions/**/*.{h,m}'
  end

  s.subspec 'Segues' do |ss|
    ss.source_files = 'Source/Segues/**/*.{h,m}'
  end

end