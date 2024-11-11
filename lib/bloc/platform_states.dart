abstract class PlatformStates {}

class PaltformAppInitialState extends PlatformStates {}

class PlatformChangeModeState extends PlatformStates {}

class PlatformChangeLanguageState extends PlatformStates {}

// login
class PaltformChangePasswordSecureState extends PlatformStates {}

class PlatformLoginLoadingState extends PlatformStates {}

class PlatformLoginSuccessState extends PlatformStates {}

class PlatformLoginFailState extends PlatformStates {
  String err;
  PlatformLoginFailState(this.err);
}
