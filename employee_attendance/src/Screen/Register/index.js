import { useEffect } from "react";
import { View } from "react-native";
import DropDown from "../../Components/DropDown/Index";
import InputFields from "../../Components/InputFields";
import MyButton from "../../Components/MyButton/Index";
import useForm from "../../Hooks/useForm/Index";
import AuthForm from "../../Layout/AuthForm/Index";
import { useLazyRegisterQuery } from "../../Redux/Services/AuthSlice";
import { DropDownData } from "../Login/constant";
import { initialFormValue, validateForm } from "../Register/constant";

const Register = ({ navigation }) => {
  const { handleChange, formObject, fieldError, handleSubmit, setFormObject } =
    useForm({
      initialValue: initialFormValue,
      callback: handleSuccess,
      validate: validateForm,
    });

  const [
    handleRegister,
    { data, isSuccess, isFetching, isLoading, isError, error },
  ] = useLazyRegisterQuery();

  function handleSuccess() {
    handleRegister(formObject);
  }

  useEffect(() => {
    console.log(data, error);
    // if (isSuccess) {
    //   setFormObject(initialFormValue);
    //   if (data?.id) {
    //     navigation.navigate("login");
    //     showToast("Register  Successfully");
    //   } else {
    //     showToast(data?.status);
    //   }
    // }
    // if (isError) {
    //   console.warn(error);
    //   setFormObject(initialFormValue);
    // }
  }, [data, isSuccess, isError, isFetching]);
  return (
    <AuthForm
      heading={"Sign Up"}
      bottomText1={`Already have an account ?`}
      bottomText2={`Login`}
      onPress={() => {
        navigation.navigate("login");
      }}
    >
      <View className={`w-full`}>
        <InputFields
          placeholder={"Enter Name"}
          label={`Name`}
          name="name"
          onMyChangeText={handleChange}
          value={formObject?.name}
          invalidText={fieldError?.name}
        />
        <InputFields
          placeholder={"Enter Mobile No."}
          label={`Mobile No.`}
          name="mobile"
          onMyChangeText={handleChange}
          value={formObject?.mobile}
          invalidText={fieldError?.mobile}
          keyboardType={"phone-pad"}
        />
        <InputFields
          placeholder={"Enter Email"}
          label={`Email Id`}
          name="email"
          onMyChangeText={handleChange}
          value={formObject?.email}
          invalidText={fieldError?.email}
        />
        <InputFields
          placeholder={"Enter Password"}
          label={`password`}
          password
          name={"password"}
          onMyChangeText={handleChange}
          value={formObject?.password}
          invalidText={fieldError?.password}
        />
        <DropDown
          label={"Role"}
          placeholder={"Select Role"}
          labelField="label"
          valueField={"value"}
          data={DropDownData}
          invalidText={fieldError?.role}
          value={formObject?.role}
          name={"role"}
          onChange={handleChange}
        />
        <MyButton
          onPress={handleSubmit}
          isLoading={isLoading}
          myClassName={`mt-5`}
          title={"Sign Up"}
        />
      </View>
    </AuthForm>
  );
};

export default Register;
