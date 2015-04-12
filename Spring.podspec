Pod::Spec.new do |s|
  s.name = 'Spring'
  s.version = '1.0.3'
  s.license = 'MIT'
  s.summary = 'A library to simplify iOS animations in Swift.'
  s.homepage = 'https://github.com/MengTo/Spring'
  s.authors = { 'Meng To' => 'meng@designcode.io' }
  s.source = { :git => 'https://github.com/MengTo/Spring.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'Spring/*.swift'
  s.resources = ['Spring/*.xib', 'SpringApp/*.xcassets']
end
