import React, { Component } from 'react';

class User extends Component {
  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <div>
        <img src={this.props.avatar} />
        <h1> {this.props.name} </h1>
      </div>
    )
  }
}

export default User;
