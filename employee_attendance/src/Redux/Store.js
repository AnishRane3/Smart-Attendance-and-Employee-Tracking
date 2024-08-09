import { configureStore } from "@reduxjs/toolkit";
import { setupListeners } from "@reduxjs/toolkit/dist/query";
import { loginAuth } from "./Services/AuthSlice";

export const Store = configureStore({
  reducer: {
    [loginAuth.reducerPath]: loginAuth.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(loginAuth.middleware),
});

setupListeners(Store.dispatch);
