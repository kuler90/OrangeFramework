#
# Be sure to run `pod lib lint OrangeFrameworkObjC.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = "OrangeFrameworkObjC"
  s.version          = "0.1.1"
  s.summary          = "Powerful framework aimed at fast and high quality developing mobile apps on Objective-C."
  s.description      = <<-DESC
                       OrangeFramework is a collection of components for fast and high quality developing mobile apps on Objective-C.
                       It includes a light-weight iOC container (used for dependency injection), flexible logger, powerful extensions and simple system info getter.
                       DESC
  s.homepage         = "https://github.com/kuler90/OrangeFramework"
  s.license          = 'MIT'
  s.author           = { "Roman Kulesha" => "kulesha.r@gmail.com" }
  s.source           = { :git => "https://github.com/kuler90/OrangeFramework.git", :tag => s.version.to_s }
  s.default_subspecs = 'Dependency', 'Log', 'SystemInfo', 'Extensions', 'Segues'
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.subspec 'Dependency' do |ss|
    ss.source_files = 'Source/Dependency/**/*.{h,m}'
    ss.private_header_files = 'Source/Dependency/**/__OFPrivateServiceLocator.h'
  end

  s.subspec 'Log' do |ss|
    ss.source_files = 'Source/Log/**/*.{h,m}'
  end

  s.subspec 'SystemInfo' do |ss|
    ss.source_files = 'Source/SystemInfo/**/*.{h,m}'
  end

  s.subspec 'Extensions' do |ss|
    ss.source_files = 'Source/Extensions/**/*.{h,m}'
    ss.public_header_files = 'Source/Dependency/**/OFExtensions.h'
  end

  s.subspec 'Segues' do |ss|
    ss.source_files = 'Source/Segues/**/*.{h,m}'
    ss.public_header_files = 'Source/Dependency/**/OFSegues.h'
  end

end