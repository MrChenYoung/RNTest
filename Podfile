# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RNTest' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for RNTest

# 'node_modules'目录一般位于根目录中
  # 但是如果你的结构不同，那你就要根据实际路径修改下面的`:path`
  pod 'React', :path => './RN/node_modules/react-native', :subspecs => [
    'Core',
    'CxxBridge', # 如果RN版本 >= 0.45则加入此行
    'DevSupport', # 如果RN版本 >= 0.43，则需要加入此行才能开启开发者菜单
    'RCTText',
    'RCTNetwork',
    'RCTWebSocket', # 这个模块是用于调试功能的
    'RCTLinkingIOS',
    'RCTImage'
    # 在这里继续添加你所需要的RN模块
  ]
  # 如果你的RN版本 >= 0.42.0，则加入下面这行
  pod "yoga", :path => "./RN/node_modules/react-native/ReactCommon/yoga"

   # 如果RN版本 >= 0.45则加入下面三个第三方编译依赖
  pod 'DoubleConversion', :podspec => './RN/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => './RN/node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'Folly', :podspec => './RN/node_modules/react-native/third-party-podspecs/Folly.podspec'

end
