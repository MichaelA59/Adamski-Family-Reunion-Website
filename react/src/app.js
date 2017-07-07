import React, { Component } from 'react';
import Photo from './components/Photo';

class App extends Component {
  constructor(props){
    super(props)
    this.state = {
      photos: []
    }
    this.fetchRecentUploads = this.fetchRecentUploads.bind(this)
  }

  fetchRecentUploads() {
    fetch(`/api/v1/photos`, {credentials: 'same-origin'})
    .then(response => response.json())
    .then(photoResponse => {
      this.setState({ photos: photoResponse })
    })
  }

  componentWillMount() {
    this.fetchRecentUploads();
  }

  render() {
    let photos = this.state.photos.map(photo => {
      return(
        <Photo
          key={photo.id}
          id={photo.id}
          photo={photo.photo.medium.url}
        />
      )
    })

    return(
      <div>
        {photos}
      </div>
    )
  }
}

export default App;
