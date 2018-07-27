import React, {
  Component
} from 'react';
import {
  View,
  Text,
  Button,
} from 'react-native';

export default class HomeScreen extends Component {

  render() {
    return <View style={{flex:1,backgroundColor:'white',justifyContent:'center',alignItems:'center'}}>
      <Text>RN页面</Text>
      </View>
  }
}