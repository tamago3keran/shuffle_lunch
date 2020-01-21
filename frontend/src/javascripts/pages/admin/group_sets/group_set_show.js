import React from 'react';
import ReactDOM from 'react-dom';
import Sidebar from '../../../components/Sidebar';

ReactDOM.render(
  <Sidebar activeList="adminGroups" admin={true} />,
  document.getElementById('js-admin_group_set_show'),
);
