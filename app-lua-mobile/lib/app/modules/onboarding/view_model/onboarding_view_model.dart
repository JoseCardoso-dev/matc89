class OnboardingViewModel {
  static final OnboardingViewModel _instance = OnboardingViewModel._internal();

  factory OnboardingViewModel() {
    return _instance;
  }

  OnboardingViewModel._internal();
}
