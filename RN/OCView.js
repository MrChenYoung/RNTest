import React, {
	Component
} from 'react';
import {
	StyleSheet,
  View,
	Text,
	Button,
	NativeModules,
  NativeEventEmitter,
} from 'react-native'

export default class OCView extends Component {
	constructor (props){
		super(props);

		this.state = {
      staticData: '暂无静态数据',
		}
	}

	render() {
		return <View style={styles.containerStyle}>
			<Button
        title='从原生获取静态数据'
        onPress={()=>{this.getConst()}}
      />
			<Button
        title='调用原生方法,进入原生页面(RN给原生传值)'
        onPress={()=>{this.callOriginalFunc()}}
      />
			<Button
        title='调用原生方法,并回调(原生给RN传值)'
        onPress={()=>{this.callOriginalFuncWithCallBack()}}
      />
			<Button
        title='原生发送通知'
        onPress={()=>{
        	NativeModules.commModule.sendMsg('');
				}}
      />
		</View>
	}

	// 从原生获取静态数据
	getConst(){
		let iosExport = JSON.stringify(NativeModules.commModule);
		alert('获取到静态数据:' + iosExport);
	}

	// 调用原生方法,并传数据给原生
	callOriginalFunc(){
		NativeModules.commModule.toNewPage('我是从RN传过来的');
	}

	// 调用原生方法，并回调，实现从原生传数据给RN
	callOriginalFuncWithCallBack(){
		NativeModules.commModule.rnToIOS('',(error,params)=>{
			alert(params)
		})
	}

	// 添加通知监听
  componentWillMount () {
		let commModule = NativeModules.commModule;

		// //用获取的模块创建监听器
		let emitter = new NativeEventEmitter(commModule);

		// 添加监听
		this.emitter = emitter.addListener('notificationName',(body)=>{
			// 收到通知回调
			alert('收到通知,内容为:'+body);
		})
  }

  // 移除监听
  componentWillUnmount () {
		this.emitter.remove();
  }
}

const styles = StyleSheet.create({
	containerStyle: {
		flex: 1,
		justifyContent: 'center',
		alignItems:'center'
	},
	textStyle: {
		fontSize: 20,
		color: 'green'
	}
});