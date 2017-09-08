import React, { Component } from 'react';
import { connect } from 'react-redux';
import HomeScreen from '../components/HomeScreen';
import { listAllNews } from '../actions/news';

class Home extends Component {
  componentWillMount() {
    this.props.listAllNews();
  }

  render() {
    const news = this.props.news;

    return (
      <HomeScreen news={news} />
    );
  }
}

const mapStateToProps = state => ({
  news: state.news.news,
});

const mapActionsToProps = {
  listAllNews,
};

export default connect(mapStateToProps, mapActionsToProps)(Home);
