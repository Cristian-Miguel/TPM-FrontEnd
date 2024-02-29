class ErrorMessage {
  /* FIELD ERROR MESSAGE*/
  //Generic respose
  static const emptyField = "Empty field";

  static const onlyLetters = 'Enter only letters';

  static const notValidDate = 'Enter a valid date with format yyyy-mm-dd';

  static const notValidEmail = 'Enter a valid email address';

  static const notValidRfc = 'Enter a valid RFC';

  //Password error
  static const String notValidateCharacters =
      "Password must have min: \n 1 Lowercase \n 1 Uppercase \n 1 Number \n 1 Special character !@#\$%^&*-_=+()[]{};:'\"|<,>./?`~\\ \n Greater than 8 characters\n Less than 16 characters";

  static const String notMatchPassword = 'Password don\'t match';
}
