Pod::Spec.new do |s|
  s.name          = "HMDevKitObjc"
  s.version       = "0.0.1"
  s.summary       = "ObjectiveC libraries for ios development"
  s.homepage      = "http://HelloMihai.wordpress.com"
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = "HelloMihai"
  s.platform      = :ios, "7.0"
  s.source        = { :git => "https://github.com/HelloMihai/HMDevKitObjc.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc  = true
end
