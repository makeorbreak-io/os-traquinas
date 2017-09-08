import React from 'react';
import { ConnectedRouter } from 'react-router-redux';
import { Route } from 'react-router';
import Home from './containers/Home';

const Router = ({ history }) => (
  <ConnectedRouter history={history}>
    <div>
      <Route
        exact
        path="/"
        render={() => <Home />}
      />
    </div>
  </ConnectedRouter>
);

export default Router;
