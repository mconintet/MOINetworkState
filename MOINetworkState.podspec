Pod::Spec.new do |spec|
  spec.name         = 'MOINetworkState'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/mconintet/MOINetworkState'
  spec.authors      = { 'mconintet' => 'mconintet@gmail.com' }
  spec.summary      = 'Listen network state in Object-C for iOS'
  spec.source       = { :git => 'https://github.com/mconintet/MOINetworkState.git', :tag => '0.0.1' }
  spec.source_files = 'MOINetworkState'
  spec.ios.deployment_target = '9.0'
end