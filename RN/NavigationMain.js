import React, { Component } from 'react';
import {
  StyleSheet,
  AppRegistry,
  View,
  Text,
  Button,
  NativeModules
} from 'react-native';
import { StackNavigator } from 'react-navigation';

class HomeScreen extends Component{
  render(){
    return <View style={{flex:1,justifyContent:'center',alignItems:'center'}}>
      <Text style={{fontSize:18,color:'green'}}>
        主页
      </Text>
      <Button title='点击' onPress={()=>{alert(this.props.navigation.pageName)}}/>
      <Text>{this.props.navigation.state.params.token}</Text>
    </View>
  }
}

class MineScreen extends Component{
  render() {
    return <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 18, color: 'green' }}>
        我的
      </Text>
    </View>
  }
}

const navigationRouteConfig = {
  Home:{
    screen:HomeScreen,
    navigationOptions:{
      headerTitle:'首页',
      headerLeft:<Button title='返回' onPress={()=>{NativeModules.commModule.pop()}}/>
    }
  },
  Mine:{
    screen:MineScreen,
    navigationOptions:{
      headerTitle:'我的'
    }
  }
}

const token = this.props.token;
const navigationOptions = {
  initialRouteName:'Home',
initialRouteParams:{"token":token}
}

const NavMain = StackNavigator(navigationRouteConfig,navigationOptions);

AppRegistry.registerComponent('NavMain',()=>NavMain)
