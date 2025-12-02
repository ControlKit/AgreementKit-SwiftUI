Pod::Spec.new do |spec|
  spec.name         = 'AgreementKit-SwiftUI'
  spec.version      = '0.0.1'
  spec.summary      = 'A short description of AgreementKit.'

  spec.license = 'MIT'
  spec.summary = 'The launch Agreement in all app is handled easily.'
  spec.homepage = 'https://github.com/ControlKit/AgreementKit-SwiftUI'
  spec.source = { :git => 'https://github.com/ControlKit/AgreementKit-SwiftUI.git', :tag => "#{spec.version}" }
  spec.ios.deployment_target = '13.0'
  spec.source_files = 'Sources/*.swift', 'Sources/**/*.swift', 'Sources/**/**/*.swift'
  spec.resources = 'Sources/AgreementKit-SwiftUI/Resources/*.xcassets'
  spec.authors = { 'Maziar Saadatfar' => 'maziar.saadatfar@gmail.com' }
  spec.swift_versions = ['5.0']
end
