import React, { Component } from 'react';
import {
  StyleSheet,
  View,
  Text,
  Button
} from 'react-native';

import MainView from './OCView';
import Main from './Main';

export default class App extends Component{
  constructor (props){
    super(props);

    let mainComponent = null;
    if (this.props.page === 'main') {
      mainComponent = <Main />;
    } else {
      mainComponent = <MainView />;
    }

    this.state={
      mainCom:mainComponent
    }
  }
  render() {
    return (
      this.state.mainCom
    );
  }
}
