class LoginViewModel {
  static final LoginViewModel _instance = LoginViewModel._internal();

  factory LoginViewModel() {
    return _instance;
  }

  LoginViewModel._internal();
}
