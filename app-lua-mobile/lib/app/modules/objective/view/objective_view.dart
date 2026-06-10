import 'package:app_lua_mobile/app/modules/cours/view/cours_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../view_model/objective_view_model.dart';

class ObjectiveView extends StatefulWidget {
  const ObjectiveView({super.key});

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView> {
  final vm = ObjectiveViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/objectives/clouds_background.svg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      vm.titlePart1,
                      style: const TextStyle(
                        color: Color(0xFF3F414E),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      vm.titlePart2,
                      style: const TextStyle(
                        color: Color(0xFF3F414E),
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      vm.subtitle,
                      style: const TextStyle(
                        color: Color(0xFFA1A4B2),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _buildCard(vm.objectives[0], 210),
                              const SizedBox(height: 16),
                              _buildCard(vm.objectives[2], 160),
                              const SizedBox(height: 16),
                              _buildCard(vm.objectives[4], 210),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              _buildCard(vm.objectives[1], 160),
                              const SizedBox(height: 16),
                              _buildCard(vm.objectives[3], 210),
                              const SizedBox(height: 16),
                              _buildCard(vm.objectives[5], 160),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(ObjectiveModel objective, double height) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) =>
                CoursDetailView(partsViewColor: objective.backgroundColor),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: objective.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            if (objective.imagePath != null)
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  objective.imagePath!,
                  fit: BoxFit.contain,
                  placeholderBuilder: (BuildContext context) =>
                      const CircularProgressIndicator(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    objective.title,
                    style: TextStyle(
                      color: objective.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
