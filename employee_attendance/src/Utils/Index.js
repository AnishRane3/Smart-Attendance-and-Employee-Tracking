import { ToastAndroid } from "react-native";

export function showToast(msg) {
  ToastAndroid.show(msg, ToastAndroid.SHORT);
}
