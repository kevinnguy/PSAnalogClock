Pod::Spec.new do |s|
  s.name     = 'PSAnalogClock'
  s.version  = '0.0.1'
  s.platform = :ios, '5.0'
  s.summary  = 'FORKED: A class for making analog style clocks with your own provided images.'
  s.homepage = 'https://github.com/kevinnguy/PSAnalogClock'
  s.license  = { 'type' => 'Custom', 'text' => 'Copyright 2011 www.paul-samuels.com. All rights reserved.' }
  s.author   = { 'Paul Samuels' => 'paulio1987@gmail.com' }
  s.source   = { :git => 'https://github.com/kevinnguy/PSAnalogClock.git', :tag => :master }
  s.source_files = 'AnalogClockWithImages/PSAnalogClockView.{h,m}'

  s.requires_arc = true
end