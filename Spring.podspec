Pod::Spec.new do |s|
  s.name = 'Spring'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Animation library written in Swift. Optimize for use in Storyboard and take advantages of IBInspectable.'
  s.homepage = 'https://github.com/MengTo/Spring'
  s.authors = { 'Meng To' => 'meng@designcode.io' }
  s.source = { :git => 'https://github.com/MengTo/Spring.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'Spring/*.swift'
end
