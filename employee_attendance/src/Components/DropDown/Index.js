import { useState } from "react";
import { StyleSheet, Text, View } from "react-native";
import { Dropdown } from "react-native-element-dropdown";

const DropDown = ({
  label,
  invalidText,
  data,
  labelField,
  valueField,
  name,
  onChange,
  value,
  placeholder,
}) => {
  const [isFocus, setIsFocus] = useState(false);

  return (
    <View>
      {label ? (
        <Text className={`font-semibold pl-1 text-lg capitalize`}>{label}</Text>
      ) : null}
      <View className={"bg-white rounded-lg"}>
        <Dropdown
          style={[styles.dropdown, isFocus && { borderColor: "blue" }]}
          placeholderStyle={styles.placeholderStyle}
          selectedTextStyle={styles.selectedTextStyle}
          inputSearchStyle={styles.inputSearchStyle}
          iconStyle={styles.iconStyle}
          data={data}
          search
          maxHeight={300}
          labelField={labelField}
          valueField={valueField}
          placeholder={!isFocus ? placeholder : ""}
          searchPlaceholder="Search..."
          value={value}
          onFocus={() => setIsFocus(true)}
          onBlur={() => setIsFocus(false)}
          name={name}
          onChange={(item) => {
            onChange({ name, text: item?.value });
            setIsFocus(false);
          }}
        />
      </View>
      {invalidText ? (
        <Text className={`pl-1 text-red-500`}>{invalidText}</Text>
      ) : null}
    </View>
  );
};

export default DropDown;

const styles = StyleSheet.create({
  container: {
    backgroundColor: "white",
    padding: 16,
  },
  dropdown: {
    height: 50,
    borderColor: "gray",
    borderWidth: 0.5,
    borderRadius: 8,
    paddingHorizontal: 8,
  },
  icon: {
    marginRight: 5,
  },
  label: {
    position: "absolute",
    backgroundColor: "white",
    left: 22,
    top: 8,
    zIndex: 999,
    paddingHorizontal: 8,
    fontSize: 14,
  },
  placeholderStyle: {
    fontSize: 16,
  },
  selectedTextStyle: {
    fontSize: 16,
  },
  iconStyle: {
    width: 20,
    height: 20,
  },
  inputSearchStyle: {
    height: 40,
    fontSize: 16,
  },
});
