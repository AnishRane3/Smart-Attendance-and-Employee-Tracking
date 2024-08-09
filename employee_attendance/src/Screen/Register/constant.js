export const initialFormValue = {
  name: "",
  mobile: "",
  email: "",
  password: "",
  role: "",
};

export const validateForm = (obj) => {
  let errors = {};
  if (obj?.name?.length === 0) errors.name = "Name is required";
  if (obj?.mobile?.length === 0) errors.mobile = "Mobile No. is required";
  if (obj?.email?.length === 0) errors.email = "Email id is required";
  if (obj?.password?.length === 0) errors.password = " password is required";
  if (obj?.role?.length === 0) errors.role = " Role  is required";
  return errors;
};
