import React, { Component } from 'react';

class User extends Component {
  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    let username = '';
    if (this.props.name === nil) {
      username = `${this.props.first_name} + ' ' + ${this.props.last_name}`
    }
    else {
      username = this.props.name
    }

    return (
      <div className='user-card' onClick={this.props.handleUserSelect}>
        <img src={this.props.avatar} />
        <h2> {username} </h2>
      </div>
    )
  }
}

export default User;
