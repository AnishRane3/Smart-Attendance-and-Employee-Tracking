import { NavigationContainer } from "@react-navigation/native";
import { StatusBar } from "expo-status-bar";
import { Provider } from "react-redux";
import { Store } from "./src/Redux/Store";
import AppNavigator from "./src/Routes/AppNavigator";

export default function App() {
  return (
    <>
      <StatusBar style="dark" />
      <Provider store={Store}>
        <NavigationContainer>
          <AppNavigator />
        </NavigationContainer>
      </Provider>
    </>
  );
}
