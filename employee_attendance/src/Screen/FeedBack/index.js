import { Text, View } from "react-native";
import { ScrollView } from "react-native-gesture-handler";
import InputFields from "../../Components/InputFields";
import MyButton from "../../Components/MyButton/Index";
import useForm from "../../Hooks/useForm/Index";
import { initialFormValue, validateForm } from "./constant";
import { useSendFeedbackMutation } from "../../Redux/Services/AuthSlice";
import { showToast } from "../../Utils/Index";
import { useEffect } from "react";

const FeedBack = () => {
  const { handleChange, formObject, fieldError, handleSubmit, setFormObject } =
    useForm({
      initialValue: initialFormValue,
      callback: handleSuccess,
      validate: validateForm,
    });

  const [createFeedback, feedbackRes] = useSendFeedbackMutation()

  function handleSuccess() {
    createFeedback(formObject)
  }

  useEffect(() => {
    console.log(feedbackRes)
    if (feedbackRes?.isSuccess) {
      showToast(feedbackRes?.data?.status)
      setFormObject(initialFormValue)
    }
  }, [feedbackRes])


  return (
    <ScrollView className={`p-5 flex-1`}>
      <View className={`flex-1 justify-center items-center`}>
        <View className={`bg-white w-full p-3`}>
          <InputFields
            placeholder={"Enter Name"}
            label={`Name`}
            name="name"
            onMyChangeText={handleChange}
            value={formObject?.name}
            invalidText={fieldError?.name}
          />
          <InputFields
            placeholder={"Enter Email"}
            label={`Email Id`}
            name="email_id"
            onMyChangeText={handleChange}
            value={formObject?.email_id}
            invalidText={fieldError?.email_id}
          />
          <InputFields
            placeholder={"Enter Mobile No."}
            label={`Mobile No.`}
            name={"contact"}
            onMyChangeText={handleChange}
            value={formObject?.contact}
            invalidText={fieldError?.contact}
          />
          <InputFields
            placeholder={"Enter Subject"}
            label={`Subject`}
            name={"subject"}
            onMyChangeText={handleChange}
            value={formObject?.subject}
            invalidText={fieldError?.subject}
          />
          <InputFields
            placeholder={"Enter Description"}
            label={`Description`}
            name={"description"}
            onMyChangeText={handleChange}
            value={formObject?.description}
            invalidText={fieldError?.description}
          />
          <MyButton
            onPress={handleSubmit}
            isLoading={feedbackRes?.isLoading}
            myClassName={`mt-5`}
            title={"Submit"}
          />
        </View>
      </View>
    </ScrollView>
  );
};

export default FeedBack;
