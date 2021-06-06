# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BenchmarkDemo-libWebp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BenchmarkDemo-libWebp
  pod 'YYImage/libwebp', :git => 'https://github.com/ibireme/YYImage.git', :branch => 'master'
  pod 'libwebp', '1.2.0'

  pod 'Benchmark-ShiftOperator-Case', :path => './Benchmark-ShiftOperator-Case'
end

# ENABLE_OPT_IN_DEBUG：设置 libwebp、Benchmark-ShiftOperator-Case 在 DEBUG 模式是否下开启编译优化
# ENABLE_OPT_IN_DEBUG = true：optimization level -> Fastest,Smallest[-Os]
# ENABLE_OPT_IN_DEBUG = false：optimization level -> None[-O0]
# 注意：修改 ENABLE_OPT_IN_DEBUG 后，记得执行 pod install
ENABLE_OPT_IN_DEBUG = false # true or false

post_install do |installer|

  installer.pods_project.targets.each do |target|

    if target.name == 'libwebp' || target.name == 'Benchmark-ShiftOperator-Case'

      debug = target.build_configurations.find { |c| c.name == 'Debug' }
      if ENABLE_OPT_IN_DEBUG
        debug.build_settings['GCC_OPTIMIZATION_LEVEL'] = 's'
      else
        debug.build_settings['GCC_OPTIMIZATION_LEVEL'] = '0'
      end

    end

  end

end

