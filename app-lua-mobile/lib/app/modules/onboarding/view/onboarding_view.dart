import 'package:flutter/material.dart';

import '../view_model/onboarding_view_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final vm = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
