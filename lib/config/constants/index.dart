class MainConstant {
  static const String succesfulMessage = "Succesful action";

  static const String apiGoogleEmailUrl =
      'https://www.googleapis.com/auth/userinfo.email';
  static const String apiGoogleProfileUrl =
      'https://www.googleapis.com/auth/userinfo.profile';
  static const String apiGoogleBirthDayUrl =
      'https://www.googleapis.com/auth/user.birthday.read';

  static const int errorAlert = 0;
  static const int warningAlert = 1;
  static const int infoAlert = 2;
  static const int successAlert = 3;

  static const int administrator = 1;
  static const int user = 2;
  static const int enterprice = 3;
  static const int outsider = 4;
}
