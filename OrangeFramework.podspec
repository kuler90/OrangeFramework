#
# Be sure to run `pod lib lint OrangeFramework.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = "OrangeFramework"
  s.version          = "0.1.0"
  s.summary          = "Powerful framework aimed at fast and high quality developing mobile apps on Objective-C and Swift."
  s.description      = <<-DESC
                       OrangeFramework is a collection of components for fast and high quality developing mobile apps on Objective-C and Swift.
                       It includes a light-weight iOC container (used for dependency injection), flexible logger, powerful extensions and simple system info getter.
                       DESC
  s.homepage         = "https://github.com/kuler90/OrangeFramework"
  s.license          = 'MIT'
  s.author           = { "Roman Kulesha" => "kulesha.r@gmail.com" }
  s.source           = { :git => "https://github.com/kuler90/OrangeFramework.git", :tag => s.version.to_s }
  s.default_subspecs = 'Dependency', 'Log', 'SystemInfo', 'Extensions', 'Segues'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.xcconfig = { 'SWIFT_INSTALL_OBJC_HEADER' => 'NO', 'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO' }

  s.subspec 'Dependency' do |ss|
    ss.source_files = 'Source/Dependency/**/*.{swift,h,m}'
  end

  s.subspec 'Log' do |ss|
    ss.source_files = 'Source/Log/**/*.{swift,h,m}'
  end

  s.subspec 'SystemInfo' do |ss|
    ss.source_files = 'Source/SystemInfo/**/*.{swift,h,m}'
  end

  s.subspec 'Extensions' do |ss|
    ss.source_files = 'Source/Extensions/**/*.{swift,h,m}'
  end

  s.subspec 'Segues' do |ss|
    ss.source_files = 'Source/Segues/**/*.{swift,h,m}'
  end

end
