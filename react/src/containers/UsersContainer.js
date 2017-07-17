import React, { Component } from 'react';
import User from '../components/User';
import UserDetails from '../components/UserDetails';

class UsersContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      users: [],
      selectedUserId: 0,
      selectedUserInfo: {}
    }
    this.fetchUsers = this.fetchUsers.bind(this)
    this.handleUserSelect = this.handleUserSelect.bind(this)
  }

  fetchUsers() {
    fetch('/api/v1/users', {credentials: 'same-origin'})
    .then(response => response.json())
    .then(userResponse => {
      this.setState({ users: userResponse })
    })
  }

  handleUserSelect(id) {
      let newId = id
      let i = 0;
      for(i = 0; i < this.state.users.length; i++) {
        if (this.state.users[i].id === newId) {
          this.setState({
            selectedUserId: newId,
            selectedUserInfo: this.state.users[i]
          })
        }
      }
    }

  componentWillMount() {
    this.fetchUsers();
  }

  render() {

    let activeClassName = ''
    if (this.state.selectedUserId > 0) {
      activeClassName = ''
    }
    else {
      activeClassName = 'hidden'
    }

    let users = this.state.users.map(user => {
      let className = '';
      if (this.state.selectedUserId === user.id) {
        className = 'selected';
      }

      let handleUserSelect = () => {
        this.handleUserSelect(user.id)
      }
      return(
        <User
          key={user.id}
          id={user.id}
          name={user.name}
          avatar={user.image}
          className={className}
          handleUserSelect={handleUserSelect}
        />
      )
    })
    return (
      <div className='user-list'>
        <div className='user-list__all-users'>
          {users}
        </div>
        <div className='user-list__active-user'>
          <UserDetails
            key={this.state.selectedUserInfo.id}
            id={this.state.selectedUserInfo.id}
            name={this.state.selectedUserInfo.name}
            email={this.state.selectedUserInfo.email}
            avatar={this.state.selectedUserInfo.image}
            className={activeClassName}
          />
        </div>
      </div>
    )
  }
}

export default UsersContainer;
