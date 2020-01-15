import React from 'react';
import ReactDOM from 'react-dom';
import Sidebar from '../../components/Sidebar';

ReactDOM.render(
  <Sidebar activeList="admin" admin={true} />,
  document.getElementById('js-group_new'),
);