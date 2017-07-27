import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

class UserDetails extends React.Component {
  constructor(props){
    super(props)
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

    return(
      <div className={"text-center user-card active " + this.props.className}>
        <img
          src={`${userAvatar}`}
          width='250'
          height='250'
        />
        <h1>{username}</h1>
        <h5>{this.props.email}</h5>
        <a href={`http://www.adamskitree.com/users/${this.props.id}`}><span></span></a>
      </div>
    )
  }
}
export default UserDetails;
