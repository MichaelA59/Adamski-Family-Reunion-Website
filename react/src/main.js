import 'babel-polyfill';
import React from 'react';
import { render } from 'react-dom'
import ReactDOM from 'react-dom';
import App from './App';
import UsersContainer from './containers/UsersContainer';


$(function() {
  if(document.getElementById('app')) {
    ReactDOM.render(
      <App />,
      document.getElementById('app')
    );
  }
});

$(function() {
  if(document.getElementById('user-index')) {
    ReactDOM.render(
      <UsersContainer />,
      document.getElementById('user-index')
    );
  }
});
