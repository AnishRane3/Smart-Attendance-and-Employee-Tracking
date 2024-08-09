import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";
// import { getLoginData } from "./AuthData";

const BASE_URL = "http://192.168.103.114:8080/EmployeeManagementSystem";

export const loginAuth = createApi({
  reducerPath: "login",
  baseQuery: fetchBaseQuery({
    baseUrl: BASE_URL,
    // prepareHeaders: (headers) => {
    //   const token = getLoginData()?.token;

    //   if (token) {
    //     headers.set("Authorization", `Bearer ${token}`);
    //     headers.set("Accept", "application/json");
    //   }

    //   return headers;
    // },
  }),
  tagTypes: ["emp"],
  keepUnusedDataFor: 4000,
  endpoints: (builder) => ({
    postLogin: builder.query({
      query: ({ email, password, role }) => ({
        url: `/login_api.jsp?email=${email}&password=${password}&role=${role}`,
        method: "GET",
      }),
      // transformResponse: ({ data }) => data,
    }),
    register: builder.query({
      query: (payload) => ({
        url: "/common/register",
        method: "POST",
        body: payload,
      }),
      // transformResponse: ({ data }) => data,
    }),
    markAttendance: builder.mutation({
      query: ({ userid, latitude, longitude }) => {
        console.log({ userid, latitude, longitude });
        return {
          url: `/attendance_api.jsp?id=${userid}&ci=1&longitude=${latitude}&latitude=${longitude}`,
          method: "GET",
        };
      },
      invalidatesTags: ["emp"],
      // transformResponse: ({ message }) => message,
    }),
    checkOut: builder.mutation({
      query: ({ userid, latitude, longitude }) => {
        console.log({ userid, latitude, longitude });
        return {
          url: `/attendance_api.jsp?id=${userid}&co=2&longitude=${latitude}&latitude=${longitude}`,
          method: "GET",
        };
      },
      invalidatesTags: ["emp"]
      // transformResponse: ({ message }) => message,
    }),
    getAttendanceList: builder.query({
      query: (id) => ({
        url: `/get_attendance_api.jsp?id=${id}`,
        method: "GET",
      }),
      providesTags: ['emp']
      // transformResponse: ({ message }) => message,
    }),
    sendFeedback: builder.mutation({
      query: ({ email_id, name, contact, subject, description }) => {
        console.log({email_id,name,subject,description})

        return {
          url: `/feedback_api.jsp?email_id=${email_id}&name=${name}&contact=${contact}&subject=${subject}&description=${description}`,
          method: "GET",
        };
      },
      invalidatesTags: ["emp"],
      // transformResponse: ({ message }) => message,
    }),
    sendAlert: builder.mutation({
      query: ({ userid, latitude, longitude }) => {
        console.log({ userid, latitude, longitude });
        return {
          url: `/emergency_api.jsp?user_id=${userid}&longitude=${latitude}&latitude=${longitude}`,
          method: "GET",
        };
      },
      invalidatesTags: ["emp"],
      // transformResponse: ({ message }) => message,
    }),
  }),
});

export const {
  useLazyPostLoginQuery,
  useLazyRegisterQuery,
  useMarkAttendanceMutation,
  useLazyGetAttendanceListQuery,
  useCheckOutMutation,
  useSendFeedbackMutation,
  useSendAlertMutation
} = loginAuth;
