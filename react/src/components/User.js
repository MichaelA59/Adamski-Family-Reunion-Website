import React, { Component } from 'react';

class User extends Component {
  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <div className='user-card' onClick={this.props.handleUserSelect}>
        <img src={this.props.avatar} />
        <h2> {this.props.name} </h2>
      </div>
    )
  }
}

export default User;
