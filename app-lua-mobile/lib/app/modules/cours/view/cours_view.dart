import 'package:flutter/material.dart';

import '../view_model/cours_view_model.dart';

class Cours extends StatefulWidget {
  const Cours({super.key});

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  final vm = CoursViewModel();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
