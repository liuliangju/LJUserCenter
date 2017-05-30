Pod::Spec.new do |s|
  s.name         = "LJUserCenter"
  s.version      = "0.9.0"
  s.summary      = "Custom static cell easyily, Just need to provide the data source"


  s.homepage     = "https://github.com/liuliangju/LJUserCenter"
  s.license      = "MIT"
  s.author       = { "liuliangju" => "liangjulliu@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/liuliangju/LJUserCenter.git", :tag => s.version.to_s}
  s.source_files  = "LJUserCenter/Classes/*.{h,m}"
  s.requires_arc = true
  
  s.dependency "Masonry", "~> 1.0.2"
end