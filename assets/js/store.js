import { createStore, combineReducers } from "redux";
import deepFreeze from "deep-freeze";

function session(state0 = null, action) {
  switch (action.type) {
    case "NEW_SESSION":
      return action.data;
    case "LOGOUT_OF_SESSION":
      state0 = null;
      return state0;
    default:
      return state0;
  }
}

function users(state0 = [], action) {
  switch (action.type) {
    case "USER_LIST":
      return action.data;
    case "NEW_USER":
      return action.data;
    case "DELETE_USER":
      state0 = null;
      return state0;
    default:
      return state0;
  }
}

function root_reducer(state0, action) {
  let reducer = combineReducers({
    session,
    users
  });
  let state1 = reducer(state0, action);
  return state1;
}

let store = createStore(root_reducer);
export default store;
