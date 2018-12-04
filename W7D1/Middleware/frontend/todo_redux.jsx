import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';
import { callbackify } from 'util';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  addLoggingToDispatch(store)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);

});

const addLoggingToDispatch = (store) => {
  let oldState = store.dispatch;
  return (action) => {
    console.log(oldState)
    console.log(action)
    const newState = oldState.dispatch(action)
    console.log(newState.geState());
  }};


