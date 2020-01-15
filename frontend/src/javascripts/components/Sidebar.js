import React from 'react';
import Drawer from '@material/react-drawer';
import List, {
  ListItem,
  ListItemGraphic,
  ListItemText,
} from '@material/react-list';
import MaterialIcon from '@material/react-material-icon';
import '../../styles/components/Sidebar.scss';

class Sidebar extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Drawer className="sidebar-container">
        <List>
          <ListItem
            tag="a"
            href="/users"
            activated={this.props.activeList == 'users'}>
            <ListItemGraphic graphic={<MaterialIcon icon="account_box" />} />
            <ListItemText primaryText="Users" />
          </ListItem>
          <ListItem
            tag="a"
            href="/group_sets"
            activated={this.props.activeList == 'groups'}>
            <ListItemGraphic graphic={<MaterialIcon icon="group" />} />
            <ListItemText primaryText="Groups" />
          </ListItem>
          <ListItem
            tag="a"
            href="/restaurants"
            activated={this.props.activeList == 'restaurants'}>
            <ListItemGraphic graphic={<MaterialIcon icon="storefront" />} />
            <ListItemText primaryText="Restaurants" />
          </ListItem>
        </List>
      </Drawer>
    );
  }
}

export default Sidebar;
