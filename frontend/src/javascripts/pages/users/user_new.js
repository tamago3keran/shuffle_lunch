import React from 'react';
import ReactDOM from 'react-dom';
import Sidebar from '../../components/Sidebar';

ReactDOM.render(
  <Sidebar activeList="users" admin={true} />,
  document.getElementById('js-user_new'),
);
