import React, { Component } from 'react';
import { Link } from 'react-router';

class Photo extends Component {
  constructor(props){
    super(props);
    this.state = {}
  }

  render() {
    return (
      <div>
        <img src={this.props.photo} />
      </div>
    )
  }
}

export default Photo;
