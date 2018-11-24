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
		let data = this.props["data"];
		return <View style={{flex:1,backgroundColor:'white',justifyContent:'center',alignItems:'center'}}>
      <Text>RN页面</Text>
      <Text>{data}</Text>
      </View>
	}
}