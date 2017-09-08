import React from 'react';

const HomeScreen = ({ news }) => (
  <div>
    {news.map((n) => (
      <div>
        <ul>
          <li>Title: {n.title} </li>
          <li>Image: {n.img} </li>
          <li>URL: {n.url} </li>
          <li>Body: {n.info.body} </li>
          <li>Date: {n.info.date} </li>
        </ul>
      </div>
    ))}
  </div>
);

export default HomeScreen;
