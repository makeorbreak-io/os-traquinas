import { requestGet, requestPost, requestPatch } from '../utils/api-handler';
import { setError } from './error'
import { LIST_NEWS } from './types'

export function listAllNews() {
  return (dispatch) => {
    requestGet('news')
      .then((response) => {
        if (response.body.error) {
          dispatch(setError(response.body.error, 'listNews'));
        } else {
          dispatch(listNews(response.body.news));
        }
        return null;
      }).catch(err => dispatch(setError(err.message, 'listNews')));
  };
}

function listNews(news) {
  return {
    type: LIST_NEWS,
    payload: {
      news
    },
  };
}
