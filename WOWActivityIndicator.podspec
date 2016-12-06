Pod::Spec.new do |s|
  s.name             = 'WOWActivityIndicator'
  s.version          = '0.1.1'
  s.summary          = 'Customizable activity indication in Swift 3.0.'

  s.description      = <<-DESC
Customizable activity indication in Swift 2.0. Drag to storyboard during design time.
                       DESC

  s.homepage         = 'https://github.com/zhouhao27/WOWActivityIndicator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zhou Hao' => 'zhou.hao.27@gmail.com' }
  s.source           = { :git => 'https://github.com/zhouhao27/WOWActivityIndicator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WOWActivityIndicator/Classes/**/*'
end
