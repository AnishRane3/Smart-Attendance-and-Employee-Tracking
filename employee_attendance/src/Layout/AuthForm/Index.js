import { FontAwesome } from "@expo/vector-icons";
import { Pressable, ScrollView, Text, View,Image} from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";

const AuthForm = ({ children, heading, onPress, bottomText1, bottomText2 }) => {
  return (
    <SafeAreaView className={`bg-white flex-1 justify-center items-center`}>
      <ScrollView
        contentContainerStyle={{
          justifyContent: "center",
          alignItems: "center",
          flex: 1,
        }} 
      >
        <View style={{borderTopLeftRadius:20 ,borderTopRightRadius:20,borderBottomLeftRadius:30,borderBottomRightRadius:30,backgroundColor:'#f0f0fa'}}>
        <FontAwesome name="users" size={65} color="rgb(29 78 216)" style={{alignSelf:'center',position:'relative',marginTop:20}}/>
        <Text className={`text-xl pb-5 font-bold self-center `}>Employees Attendance</Text>
        <View
          className={`w-11/12 px-2 py-8 justify-center items-center border border-gray-200 rounded-[30px]`}
          style={{backgroundColor:'#e1e1f0'}}
        >
          <Text className={`font-bold text-2xl`}>{heading}</Text>
          <View className={`w-full`}>{children}</View>
          {/* <Pressable onPress={onPress}>
            <View className={`flex-row pt-5 gap-2`}>
              <Text>{bottomText1}</Text>
              <Text className={`text-blue-500`}>{bottomText2}</Text>
            </View>
          </Pressable> */}
        </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default AuthForm;
