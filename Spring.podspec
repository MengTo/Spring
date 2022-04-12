Pod::Spec.new do |s|
  s.name = 'Spring'
  s.version = '1.0.9'
  s.license = 'MIT'
  s.summary = 'A library to simplify iOS animations in Swift.'
  s.homepage = 'https://github.com/LexDeBash/Spring'
  s.authors = { 'Meng To' => 'meng@designcode.io' }
  s.source = { :git => 'https://github.com/LexDeBash/Spring.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '14.0'
  s.tvos.deployment_target = '11.0'
  s.source_files = 'Sources/Spring/*.swift'
  s.ios.resources = ['Sources/Spring/*.xib', 'SpringApp/*.xcassets']
  s.tvos.resources = ['SpringApp/*.xcassets']
end
