import React, { Component } from 'react';

class User extends Component {
  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    // Devise VS OAuth Username conditional value
    let username = '';
    if (this.props.name === null) {
      username = `${this.props.firstName} ${this.props.lastName}`
    }
    else {
      username = this.props.name
    }

    // Avatar Placeholder VS Uploaded Avatar
    let userAvatar = '';
    if (this.props.avatar === null) {
      userAvatar = 'https://africafunders.com/wp-content/uploads/2017/06/avatar-placeholder.png';
    }
    else {
      userAvatar = this.props.avatar
    }

    return (
      <div className='user-card' onClick={this.props.handleUserSelect}>
        <img src={userAvatar} />
        <h2> {username} </h2>
      </div>
    )
  }
}

export default User;
