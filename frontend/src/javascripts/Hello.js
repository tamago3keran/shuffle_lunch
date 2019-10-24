'use strict';

import React from 'react';
import ReactDOM from 'react-dom';

class Hello extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>{`Hello ${this.props.name}`}</h1>
      </div>
    );
  }
}

ReactDOM.render(<Hello name="Takuma" />, document.getElementById('root'));
