import React, { useEffect } from "react";
import { Text, View } from "react-native";
import { useDispatch } from "react-redux";
import { loginAuth } from "../../Redux/Services/AuthSlice";
import { showToast } from "../../Utils/Index";

const Profile = ({ navigation }) => {
  const dispatch = useDispatch();
  useEffect(() => {
    showToast("Logged Out Successfully");
    navigation.navigate("login");
    dispatch(loginAuth.util.resetApiState());
  }, []);

  return (
    <View>
      <Text>Profile</Text>
    </View>
  );
};

export default Profile;
