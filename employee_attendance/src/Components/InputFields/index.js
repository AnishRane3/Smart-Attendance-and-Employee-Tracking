import { Entypo } from "@expo/vector-icons";
import React, { useState } from "react";
import { Pressable, Text, TextInput, View } from "react-native";

const InputFields = ({
  keyboardType,
  label,
  placeholder,
  name,
  onMyChangeText,
  password,
  invalidText,
  value,
}) => {
  const [showPassword, setshowPassword] = useState(true);

  return (
    <View className={`w-full`}>
      {label ? (
        <Text className={`font-semibold pl-1 text-lg capitalize`}>{label}</Text>
      ) : null}
      <View className={`w-full flex-row`}>
        <TextInput
          placeholder={placeholder}
          value={value}
          onChangeText={(text) => {
            onMyChangeText({ name, text });
          }}
          className={`bg-white p-3 text-lg  border-gray-200 ${
            password
              ? "w-[90%] rounded-l-lg border-l"
              : "w-full border rounded-lg"
          }`}
          keyboardType={keyboardType || "default"}
          secureTextEntry={password ? showPassword : false}
        />
        {password ? (
          <View
            className={`pr-1 justify-center items-center border-r w-[10%] bg-white border-gray-200 rounded-r-lg`}
          >
            <Pressable
              onPress={() => {
                setshowPassword(!showPassword);
              }}
            >
              {showPassword ? (
                <Entypo name="eye-with-line" size={24} color="gray" />
              ) : (
                <Entypo name="eye" size={24} color="gray" />
              )}
            </Pressable>
          </View>
        ) : null}
      </View>

      {invalidText ? (
        <Text className={`pl-1 text-red-500`}>{invalidText}</Text>
      ) : null}
    </View>
  );
};

export default InputFields;
