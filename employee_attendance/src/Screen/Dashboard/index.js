import { FontAwesome5 } from "@expo/vector-icons";
import * as Location from "expo-location";
import React, { useEffect, useState } from "react";
import { Alert } from "react-native";
import { FloatingAction } from "react-native-floating-action";
import MapView, { Marker } from "react-native-maps";
import { SafeAreaView } from "react-native-safe-area-context";
import { getLoginData } from "../../Redux/Services/AuthData";
import {
  useCheckOutMutation,
  useMarkAttendanceMutation
} from "../../Redux/Services/AuthSlice";
import { showToast } from "../../Utils/Index";

const Dashboard = () => {
  const [region, setregion] = useState({
    latitude: 19.45636,
    longitude: 72.792458,
    latitudeDelta: 5,
    longitudeDelta: 5,
  });
  const [currentLocation, setcurrentLocation] = useState(null);

  const [handleMarkAttendance, attendanceRes] = useMarkAttendanceMutation();
  const [handleout, outRes] = useCheckOutMutation();

  const getLocationPermission = () => {
    Location.requestForegroundPermissionsAsync()
      .then(({ status }) => {
        if (status !== "granted") {
          showToast("Permission to access location was denied");
        } else {
          Location.getCurrentPositionAsync({})
            .then((location) => {
              const cords = location?.coords;
              setcurrentLocation({ userid: getLoginData()?.id, ...cords });
            })
            .catch((err) => showToast(JSON.stringify(err)));
        }
      })
      .catch((err) => showToast(JSON.stringify(err)));
  };

  const actions = [
    {
      text: "Check In",
      icon: <FontAwesome5 name="user-check" size={20} color="white"/>,
      name: "in",
      position: 1,
      color: "#1d4ed8",
      buttonSize: 44,
      textStyle: { justifyContent: "center", alignItems: "center" },
    },
    {
      text: "Check Out",
      icon: <FontAwesome5 name="user-check" size={20} color="white"/>,
      name: "out",
      position: 1,
      color: "#1d4ed8",
      buttonSize: 44,
      textStyle: { justifyContent: "center", alignItems: "center" },
    },
  ];

  useEffect(() => {
    if (attendanceRes?.isSuccess || attendanceRes?.isError) {
      Alert.alert(JSON.stringify(attendanceRes?.error?.data));
    }
    if (outRes?.isSuccess || outRes?.isError) {
      Alert.alert(JSON.stringify(outRes?.error?.data));
    }

    // if (attendanceRes?.isSuccess) {
    //   console.log("at", attendanceRes?.data);
    //   // showToast(JSON.stringify(attendanceRes?.data?.status));
    // }

    // if (attendanceRes?.isError) {
    //   showToast(JSON.stringify(attendanceRes?.error));
    // }
    if (attendanceRes?.isLoading) {
      showToast("Processing...");
    }
    if (outRes?.isLoading) {
      showToast("Processing...");
    }
  }, [attendanceRes, outRes]);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <MapView
        showsUserLocation={true}
        followsUserLocation={true}
        zoomTapEnabled={true}
        zoomControlEnabled={false}
        userLocationAnnotationTitle="Current Location"
        style={{ flex: 1 }}
        region={region}
        onMapReady={() => {
          getLocationPermission();
        }}
      >
        {currentLocation ? (
          <Marker
            coordinate={{
              latitude: currentLocation?.latitude,
              longitude: currentLocation?.longitude,
            }}
            title={`Current Location`}
            pinColor={"#0096FF"}
          />
        ) : null}
      </MapView>
      <FloatingAction
        actions={actions}
        color={"#1d4ed8"}
        onPressItem={(name) => {
          if (currentLocation) {
            if (name === "in") {
              handleMarkAttendance(currentLocation);
            } else {
              handleout(currentLocation);
            }
          } else {
            showToast("Getting your current location");
            getLocationPermission();
          }
        }}
      />
    </SafeAreaView>
  );
};

export default Dashboard;
