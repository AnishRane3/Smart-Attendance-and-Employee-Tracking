import { ActivityIndicator, Pressable, Text, View } from "react-native";

const MyButton = ({ isLoading, title, isDisabled, onPress, myClassName }) => {
  return (
    <Pressable
      disabled={isDisabled || isLoading}
      android_ripple={{ foreground: true, color: "#ffffff50" }}
      onPress={onPress}
    >
      <View
        className={` ${myClassName} flex-row bg-blue-700 p-2 rounded-lg justify-center items-center`}
      >
        {isLoading ? (
          <ActivityIndicator size={30} color={"white"} />
        ) : (
          <Text className={`text-white text-lg capitalize font-semibold`}>
            {title}
          </Text>
        )}
      </View>
    </Pressable>
  );
};

export default MyButton;
