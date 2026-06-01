import 'package:flutter/material.dart';

import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
