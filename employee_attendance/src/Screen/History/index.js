import { ANDROID } from "nativewind/dist/utils/selector";
import React, { useEffect } from "react";
import { ScrollView, Text, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import { getLoginData } from "../../Redux/Services/AuthData";
import { useLazyGetAttendanceListQuery } from "../../Redux/Services/AuthSlice";


const History = () => {
  const [getAttendance, AttendanceList] = useLazyGetAttendanceListQuery();

  useEffect(() => {
    getAttendance(getLoginData()?.id);
  }, []);

  return (
    <SafeAreaView
      style={{
        flex: 1,
      }}
    >
      <ScrollView style={{ paddingLeft: 15, paddingRight: 8 }} overScrollMode="never">
        {AttendanceList?.data?.table?.map((x, i) => (
          <View
            key={i}
            className={`bg-white w-full rounded-lg p-2 mb-5 border gap-2 border-gray-200`}
          >
            <Text className={`font-semibold capitalize`}>Name: {x?.name}</Text>
            <Text className={`font-semibold capitalize`}>
              Attendance Date: {x?.attendance_date || "N/A"}
            </Text>
            <Text className={`font-semibold capitalize`}>
              Check In: {x?.checkin || "N/A"}
            </Text>
            <Text className={`font-semibold capitalize`}>
              Check Out: {x?.checkout || "N/A"}
            </Text>
            <Text className={`font-semibold capitalize`}>
              Total Hours: {x?.total_hours || "N/A"}
            </Text>
            <Text className={`font-semibold capitalize`}>
              Longitude: {x?.longitude || "N/A"}
            </Text>
            <Text className={`font-semibold capitalize`}>
              Latitude: {x?.latitude || "N/A"}
            </Text>
          </View>
        ))}
      </ScrollView>
    </SafeAreaView>
  );
};

export default History;
