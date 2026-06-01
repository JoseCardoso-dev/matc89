class CoursViewModel {
  static final CoursViewModel _instance = CoursViewModel._internal();

  factory CoursViewModel() {
    return _instance;
  }

  CoursViewModel._internal();
}
