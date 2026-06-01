class HomeViewModel {
  static final HomeViewModel _instance = HomeViewModel._internal();

  factory HomeViewModel() {
    return _instance;
  }

  HomeViewModel._internal();
}
