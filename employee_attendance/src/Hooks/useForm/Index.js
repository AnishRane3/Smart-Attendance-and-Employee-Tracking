import { useEffect, useMemo, useState } from "react";

const useForm = ({ initialValue, callback, validate }) => {
  const [formObject, setFormObject] = useState(initialValue);
  const [fieldError, setFieldError] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Set Error Object From Validate Function To Error variable.
  const Error = useMemo(() => validate(formObject), [formObject, validate]);

  // Function To Change Users Input and set State from the event
  const handleChange = ({ name, text }) => {
    setFormObject((prev) => ({ ...prev, [name]: text }));
  };

  // function for submitting user Data and accordingly setting field errors if there are any or call the appropriate API
  const handleSubmit = (event) => {
    if (event) event.preventDefault();

    setFieldError(Error);
    setIsSubmitting(true);

    if (Object.keys(Error).length === 0) {
      callback();
      setIsSubmitting(false);
    }
  };

  // UseEffect for Changing Error Validation
  useEffect(() => {
    if (isSubmitting) {
      setFieldError(Error);
    }
  }, [isSubmitting, formObject]);

  return { formObject, fieldError, handleChange, handleSubmit, setFormObject };
};

export default useForm;
