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
        { this.props.admin ? this._renderAdminSideBarList() : this._renderClientSideBarList() }
      </Drawer>
    )
  }

  _renderClientSideBarList() {
    return (
      <List>
        <ListItem
          tag="a"
          href="/group_sets"
          activated={this.props.activeList == 'groups'}>
          <ListItemGraphic graphic={<MaterialIcon icon="group" />} />
          <ListItemText primaryText="グループ一覧" />
        </ListItem>
        <ListItem
          tag="a"
          href="/restaurants"
          activated={this.props.activeList == 'restaurants'}>
          <ListItemGraphic graphic={<MaterialIcon icon="storefront" />} />
          <ListItemText primaryText="お店一覧" />
        </ListItem>
        <ListItem
          tag="a"
          href="/users"
          activated={this.props.activeList == 'users'}>
          <ListItemGraphic graphic={<MaterialIcon icon="accessibility" />} />
          <ListItemText primaryText="マッチングスコアを確認" />
        </ListItem>
        <ListItem
          tag="a"
          href="/login"
          activated={this.props.activeList == 'login'}>
          <ListItemGraphic graphic={<MaterialIcon icon="exit_to_app" />} />
          <ListItemText primaryText="ログイン" />
        </ListItem>
      </List>
    );
  }

  _renderAdminSideBarList() {
    return (
      <List>
        <ListItem
          tag="a"
          href="/admin/group_sets"
          activated={this.props.activeList == 'adminGroups'}>
          <ListItemGraphic graphic={<MaterialIcon icon="group" />} />
          <ListItemText primaryText="グループ管理" />
        </ListItem>
        <ListItem
          tag="a"
          href="/admin/users"
          activated={this.props.activeList == 'adminUsers'}>
          <ListItemGraphic graphic={<MaterialIcon icon="person" />} />
          <ListItemText primaryText="ユーザー管理" />
        </ListItem>
        <ListItem
          tag="a"
          href="/logout"
          activated={this.props.activeList == 'logout'}>
          <ListItemGraphic graphic={<MaterialIcon icon="undo" />} />
          <ListItemText primaryText="ログアウト" />
        </ListItem>
      </List>
    );
  }
}

export default Sidebar;
