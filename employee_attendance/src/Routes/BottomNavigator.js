import {
  Entypo,
  MaterialCommunityIcons,
  MaterialIcons,
} from "@expo/vector-icons";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { useEffect } from "react";
import { getLoginData } from "../Redux/Services/AuthData";
import Dashboard from "../Screen/Dashboard";
import Emergency from "../Screen/Emergency";
import FeedBack from "../Screen/FeedBack";
import History from "../Screen/History";
import Profile from "../Screen/Profile";
import { showToast } from "../Utils/Index";


const Bottom = createBottomTabNavigator();

const BottomNavigator = ({ navigation }) => {
  const inActiveTabColor = "black";
  const ActiveTabColor = "#1d4ed8";

  useEffect(() => {
    console.log('in', getLoginData())
    if (!getLoginData()?.id) {
      navigation.navigate("login");
      showToast("Invalid user");
    }
  }, [getLoginData()]);

  return (
    <Bottom.Navigator>
      <Bottom.Screen
        name="dashboard"
        component={Dashboard}
        options={{
          headerShown: false,
          tabBarLabel: "Dashboard",
          tabBarInactiveTintColor: inActiveTabColor,
          tabBarActiveTintColor: ActiveTabColor,
          tabBarIcon: ({ color }) => (
            <MaterialIcons name="dashboard" size={24} color={color} />
          ),
        }}
      />
      <Bottom.Screen
        name="attendance_history"
        component={History}
        options={{
          headerTitle: "Attendance Logs",
          tabBarLabel: "Attendance Logs",
          tabBarInactiveTintColor: inActiveTabColor,
          tabBarActiveTintColor: ActiveTabColor,
          tabBarIcon: ({ color }) => (
            <MaterialIcons name="history" size={24} color={color} />
          ),
        }}
      />
      <Bottom.Screen
        name="feedback"
        component={FeedBack}
        options={{
          headerTitle: "FeedBack",
          tabBarLabel: "FeedBack",
          tabBarInactiveTintColor: inActiveTabColor,
          tabBarActiveTintColor: ActiveTabColor,
          tabBarIcon: ({ color }) => (
            <MaterialIcons name="feedback" size={24} color={color} />
          ),
        }}
      />
      <Bottom.Screen
        name="emergency_alert"
        component={Emergency}
        options={{
          headerTitle: "Emergency Alert",
          tabBarLabel: "Emergency Alert",
          tabBarInactiveTintColor: inActiveTabColor,
          tabBarActiveTintColor: ActiveTabColor,
          tabBarIcon: ({ color }) => (
            <MaterialCommunityIcons
              name="alert-octagon"
              size={24}
              color={color}
            />
          ),
        }}
      />
      <Bottom.Screen
        name="profile"
        component={Profile}
        options={{
          headerTitle: "Profile",
          tabBarLabel: "Log Out",
          tabBarInactiveTintColor: inActiveTabColor,
          tabBarActiveTintColor: ActiveTabColor,
          tabBarIcon: ({ color }) => (
            <Entypo name="log-out" size={24} color={color} />
          ),
        }}
      />
    </Bottom.Navigator>
  );
};

export default BottomNavigator;
