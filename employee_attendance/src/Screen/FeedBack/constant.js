export const initialFormValue = {
  name: "",
  email_id: "",
  contact: "",
  subject: "",
  description: "",
};

export const validateForm = (obj) => {
  let errors = {};
  if (obj?.name?.length === 0) 
  {
    errors.name = " Name is required";
  }
  else if (obj.name.length > 255) {
    errors.name = "Name should not exceed 255 characters";
  }
  else if (!/^[a-zA-Z ]+$/.test(obj.name)) {
    errors.name = "Name should only contain alphabets and spaces";
  }
  if (obj?.email_id?.length === 0) 
  {
    errors.email_id = "Email id required";
  }
  else if(!/\S+@\S+\.\S+/.test(obj.email_id))
  {
    errors.email_id = "Invalid email format";
  }
  if (obj?.contact?.length === 0) 
  {
    errors.contact = " Mobile is required";
  }
  else if (!/^[0-9]{10}$/.test(obj.contact)) {
    errors.contact = "Invalid mobile number format";
  }
  if (obj?.subject?.length === 0) 
  {
    errors.subject = " Subject is required";
  }
  else if (obj.subject.length > 255) {
    errors.subject = "Subject should not exceed 255 characters";
  }
  if (obj?.description?.length === 0)
    errors.description = " Description is required";
  return errors;
};

export const DropDownData = [
  { label: "Employee", value: "emp" },
  { label: "Admin", value: "admin" },
];
