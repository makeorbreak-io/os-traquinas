import { LIST_NEWS } from '../actions/types'

const initialState = {
  news: [],
};

export default function (state = initialState, action) {
  if (action.type === LIST_NEWS) {
    return {
      news: action.payload.news,
    };
  }
  return state;
}
