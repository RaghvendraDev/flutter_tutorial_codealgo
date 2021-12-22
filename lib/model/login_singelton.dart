class LoginSingelton {
  static String userName = "";
  static String userMobile = "";
  static String userGender = "";
  static String userProfile = "";
  static String userEmail = "";

  static bool isUserNameSet = false;
  static bool isUserMobileSet = false;
  static bool isUserEmailSet = false;
  static bool isUserGenderSet = false;
  static bool isUserProfilePicSet = false;

  LoginSingelton._internal();

  static final LoginSingelton _singelton = LoginSingelton._internal();

  factory LoginSingelton() {
    return _singelton;
  }

  //setter method

  static void setUserName(String _name) {
    userName = _name;
    isUserNameSet = true;
  }

  static void setUserEmail(String _email) {
    userEmail = _email;
    isUserEmailSet = true;
  }

  static void setUserMobile(String _mobile) {
    userMobile = _mobile;
    isUserMobileSet = true;
  }

  static void setUserGender(String _gen) {
    userGender = _gen;
    isUserGenderSet = true;
  }

  static void setUserProfilePic(String _profile) {
    userProfile = _profile;
    isUserProfilePicSet = true;
  }

  //getters
  static String getUserName() {
    return userName;
  }

  static String getUserEmail() {
    return userEmail;
  }

  static String getUserMobile() {
    return userMobile;
  }

  static String getUserGender() {
    return userGender;
  }

  static String getUserProfilePic() {
    return userProfile;
  }
}
