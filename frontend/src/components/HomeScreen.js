import React from 'react';

const HomeScreen = ({ news }) => (
  <div>
    {news.map((n) => (
      <div>
        <ul>
          <li>Title: {n.title} </li>
          <li>Image: {n.image} </li>
          <li>URL: {n.url} </li>
          <li>Body: {n.body} </li>
          <li>Date: {n.date} </li>
        </ul>
      </div>
    ))}
  </div>
);

export default HomeScreen;
