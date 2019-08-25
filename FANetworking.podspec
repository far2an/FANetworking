
Pod::Spec.new do |spec|

  spec.name         = "FANetworking"
  spec.version      = "1.0.0"
  spec.summary      = "A Networking Lib"
  spec.description  = "Networking Library based on URLSession."
  spec.homepage     = "https://github.com/far2an/FANetworking/"
  spec.license      = "MIT"
  spec.author             = { "Farzan Abdollahi" => "far.abd8050@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/far2an/FANetworking.git", :tag => "1.0.0" }
  spec.source_files  = "FANetworking/**/*"
  spec.exclude_files = "FANetworking/**/*.plist"
  spec.swift_version = '5.0'
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  spec.ios.deployment_target  = '10.0'

end
