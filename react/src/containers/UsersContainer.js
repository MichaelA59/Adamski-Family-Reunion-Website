import React, { Component } from 'react';
import User from '../components/User';
import UserDetails from '../components/UserDetails';

class UsersContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      users: [],
      selectedUserId: 1,
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
      let userInfo = this.state.users[newId - 1]
      debugger
      this.setState({
        selectedUserId: newId,
        selectedUserInfo: userInfo
      })
    }

  componentWillMount() {
    this.fetchUsers();
  }

  render() {

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
      <div>
        <div className='user-index--title-card'>
          {users}
        </div>
        <div className='user-index--details-card'>
          <UserDetails
            key={this.state.selectedUserInfo.id}
            id={this.state.selectedUserInfo.id}
            name={this.state.selectedUserInfo.name}
            email={this.state.selectedUserInfo.email}
            avatar={this.state.selectedUserInfo.image}
          />
        </div>
      </div>
    )
  }
}

export default UsersContainer;
