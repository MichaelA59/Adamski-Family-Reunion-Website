import React, { Component } from 'react';
import User from '../components/User';

class UsersContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      users: []
    }
    this.fetchUsers = this.fetchUsers.bind(this)
  }

  fetchUsers() {
    fetch('/api/v1/users', {credentials: 'same-origin'})
    .then(response => response.json())
    .then(userResponse => {
      this.setState({ users: userResponse })
    })
  }

  componentWillMount() {
    this.fetchUsers();
  }

  render() {

    let users = this.state.users.map(user => {
      return(
        <User
          key={user.id}
          id={user.id}
          email={user.email}
          name={user.name}
          avatar={user.image}
        />
      )
    })


    return (
      <div>
        {users}
      </div>
    )
  }
}
export default UsersContainer;
