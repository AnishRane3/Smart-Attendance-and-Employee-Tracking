import { useEffect } from "react";
import { View } from "react-native";
import DropDown from "../../Components/DropDown/Index";
import InputFields from "../../Components/InputFields";
import MyButton from "../../Components/MyButton/Index";
import useForm from "../../Hooks/useForm/Index";
import AuthForm from "../../Layout/AuthForm/Index";
import { useLazyPostLoginQuery } from "../../Redux/Services/AuthSlice";
import { showToast } from "../../Utils/Index";
import { DropDownData, initialFormValue, validateForm } from "./constant";

const Login = ({ navigation }) => {
  const { handleChange, formObject, fieldError, handleSubmit, setFormObject } =
    useForm({
      initialValue: initialFormValue,
      callback: handleSuccess,
      validate: validateForm,
    });

  const [
    handleLogin,
    { data, isSuccess, isFetching, isLoading, isError, error },
  ] = useLazyPostLoginQuery();

  function handleSuccess() {
    handleLogin(formObject);
  }

  useEffect(() => {
    if (isSuccess) {
      if (data?.id) {
        navigation.navigate("bottomNav");
        showToast("Logged in Successfully");
      } else {
        showToast(data?.status);
      }
      setFormObject(initialFormValue);
    }
    if (isError) {
      showToast(JSON.stringify(error));
      setFormObject(initialFormValue);
    }
  }, [data, isSuccess, isError]);

  return (
    <AuthForm
      heading={"Login"}
      bottomText1={`Don't have an account ?`}
      bottomText2={`Sign Up`}
      onPress={() => {
        navigation.navigate("register");
      }}
    >
      <View className={`w-full`}>
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
          title={"login"}
        />
      </View>
    </AuthForm>
  );
};

export default Login;
