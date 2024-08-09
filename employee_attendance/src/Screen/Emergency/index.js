import React from "react";
import { Pressable, Text, View } from "react-native";
import { showToast } from "../../Utils/Index";
import { useSendAlertMutation } from "../../Redux/Services/AuthSlice";
import { getLoginData } from "../../Redux/Services/AuthData";
import { useState } from "react";
import * as Location from "expo-location";
import { useEffect } from "react";

const Emergency = () => {
  const [sendAlert, AlertRes] = useSendAlertMutation()
  const [currentLocation, setcurrentLocation] = useState(null);


  const getLocationPermission = () => {
    Location.requestForegroundPermissionsAsync()
      .then(({ status }) => {
        if (status !== "granted") {
          showToast("Permission to access location was denied");
        } else {
          Location.getCurrentPositionAsync({})
            .then((location) => {
              const cords = location?.coords;
              setcurrentLocation({ ...cords });
            })
            .catch((err) => showToast(JSON.stringify(err)));
        }
      })
      .catch((err) => showToast(JSON.stringify(err)));
  };

  useEffect(() => {
    getLocationPermission()
  }, [])

  useEffect(() => {
    console.log(AlertRes)
    if(AlertRes?.isLoading){
      showToast('sending....')
    }
    if(AlertRes?.isSuccess){
      showToast(AlertRes?.data?.status)
    }
    
  }, [AlertRes])
  


  return (
    <View className={`justify-center items-center flex-1`}>
      <Pressable
        onPress={() => {
          if (currentLocation) {

            sendAlert({ userid: getLoginData()?.id, latitude: currentLocation?.latitude, longitude: currentLocation?.longitude })
          }
          else {
            getLocationPermission()
          }
        }}
        android_ripple={{ foreground: true, color: "#ffffff50" }}
      >
        <View className={`bg-red-500 py-16 px-12 rounded-full`}>
          <Text className={`text-white font-medium text-4xl`}>Alert</Text>
        </View>
      </Pressable>
    </View>
  );
};

export default Emergency;
