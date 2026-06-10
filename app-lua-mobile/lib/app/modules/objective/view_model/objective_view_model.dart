import 'package:flutter/material.dart';

class ObjectiveModel {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final String? imagePath;

  ObjectiveModel({
    required this.title,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.imagePath,
  });
}

class ObjectiveViewModel {
  String get titlePart1 => "O que te traz";
  String get titlePart2 => "à Lua?";
  String get subtitle => "Escolha um objetivo para abordar:";

  List<ObjectiveModel> get objectives => [
    ObjectiveModel(
      title: "Reduzir estresse",
      backgroundColor: const Color(0xFF8E97FD),
      imagePath: 'assets/objectives/reduce_stress.svg',
    ),
    ObjectiveModel(
      title: "Melhorar performance",
      backgroundColor: const Color(0xFFFA6E5A),
      imagePath: 'assets/objectives/improve_perfomance.svg',
    ),
    ObjectiveModel(
      title: "Mais felicidade",
      backgroundColor: const Color(0xFFFEB18F),
      textColor: const Color(0xFF3F414E),
      imagePath: 'assets/objectives/increase_happiness.svg',
    ),
    ObjectiveModel(
      title: "Reduzir ansiedade",
      backgroundColor: const Color(0xFFFFCF86),
      textColor: const Color(0xFF3F414E),
      imagePath: 'assets/objectives/reduce_anxiety.svg',
    ),
    ObjectiveModel(
      title: "Crescimento pessoal",
      backgroundColor: const Color(0xFF6CB28E),
      imagePath: 'assets/objectives/personal_growth.svg',
    ),
    ObjectiveModel(
      title: "Dormir melhor",
      backgroundColor: const Color(0xFF3F414E),
      imagePath: 'assets/objectives/better_sleep.svg',
    ),
  ];
}
