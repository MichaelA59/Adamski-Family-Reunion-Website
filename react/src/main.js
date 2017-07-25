import 'babel-polyfill';
import React from 'react';
import { render } from 'react-dom'
import ReactDOM from 'react-dom';
import UsersContainer from './containers/UsersContainer';

$(function() {
  if(document.getElementById('user-index')) {
    ReactDOM.render(
      <UsersContainer />,
      document.getElementById('user-index')
    );
  }
});
