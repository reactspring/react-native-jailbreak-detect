
Pod::Spec.new do |s|
  s.name          = 'react-native-jailbreak-detect'
  s.version       = '0.0.1'
  s.summary       = 'Jailbreak Detect native module for react-native'
  s.author        = "nixstory@gmail.com"
  s.license       = 'MIT'
  s.requires_arc  = true
  s.homepage      = "http://reactspring.io"
  s.source        = { :git => 'https://github.com/reactspring/react-native-jailbreak-detect' }
  s.platform      = :ios, '9.0'
  s.source_files  = "ios/**/*.{h,m}"

  s.dependency "React"
end
