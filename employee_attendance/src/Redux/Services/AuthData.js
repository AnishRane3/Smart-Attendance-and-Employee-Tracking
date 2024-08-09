import { Store } from "../Store";

export const getLoginData = () => {
  const state = Store.getState()?.login?.queries;

  const tokenkey = Object.keys(state)[0];

  let userData;

  if (tokenkey && tokenkey?.includes("postLogin")) {
    const loginData = state?.[tokenkey]?.data;

    if (loginData) {
      userData = loginData;
    }
  }
  return userData;
};
