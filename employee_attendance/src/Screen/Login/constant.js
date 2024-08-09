export const initialFormValue = { email: "", password: "", role: "" };

export const validateForm = (obj) => {
  let errors = {};
  if (obj?.email?.length === 0) 
  {
    errors.email = "Email id required";
  }
  else if (!/\S+@\S+\.\S+/.test(obj.email)) {
    errors.email = "Invalid email address";
  }
  if (obj?.password?.length === 0) 
  {
    errors.password = " password is required";
  }
  else if (obj.password.length < 6 || obj.password.length > 20) {
    errors.password = "Password length should be between 6 and 20";
  }
  if (obj?.role?.length === 0) errors.role = " Role  is required";
  return errors;
};

export const DropDownData = [
  { label: "Employee", value: "emp" },
];
