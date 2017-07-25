import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

class UserDetails extends React.Component {
  constructor(props){
    super(props)
    this.state = {}
  }

  render(){
    return(
      <div className={"text-center user-card active " + this.props.className}>
        <img
          src={`${this.props.avatar}`}
          width='250'
          height='250'
        />
        <h1>{this.props.name}</h1>
        <h5>{this.props.email}</h5>
        <a href={`http://adamskitree.com/users/${this.props.id}`}><span></span></a>
      </div>
    )
  }
}
export default UserDetails;
