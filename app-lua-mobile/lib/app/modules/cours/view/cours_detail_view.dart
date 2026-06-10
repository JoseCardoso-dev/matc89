import 'package:app_lua_mobile/app/share/widgets/button_action_widegt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoursDetailView extends StatefulWidget {
  const CoursDetailView({super.key});

  @override
  State<CoursDetailView> createState() => _CoursDetailViewState();
}

class _CoursDetailViewState extends State<CoursDetailView> {
  final playing = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF7F2),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset('assets/cours/part_view_one.svg'),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: SvgPicture.asset('assets/cours/part_view_two.svg'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SvgPicture.asset('assets/cours/part_view_three.svg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/cours/part_view_four.svg'),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      ButtonActionWidget(
                        iconPath: 'assets/x_icon.svg',
                        isBorderActive: true,
                        backgroundColor: Colors.white,
                        iconColor: Color(0xFF3F414E),
                      ),
                      const Spacer(),
                      ButtonActionWidget(
                        iconPath: 'assets/heart_icon.svg',
                        isBorderActive: true,
                        backgroundColor: Color(0xFFC4C5CA),
                        iconColor: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      ButtonActionWidget(
                        iconPath: 'assets/download_icon.svg',
                        isBorderActive: true,
                        backgroundColor: Color(0xFFC4C5CA),
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                  Text(
                    'Concentre sua atenção',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F414E),
                    ),
                  ),
                  Text(
                    '7 DIAS DE CALMA',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA0A3B1),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.replay_10_outlined,
                            color: Color(0xFFA0A3B1),
                            size: 42,
                          ),
                        ),
                      ),

                      ValueListenableBuilder(
                        valueListenable: playing,
                        builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              playing.value = !playing.value;
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Color(0xFF3F414E),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(
                                  color: Color(0xFFBABCC6),
                                  width: 10,
                                ),
                              ),
                              child: Icon(
                                value ? Icons.play_arrow : Icons.pause,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                          );
                        },
                      ),

                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.forward_10_outlined,
                          color: Color(0xFFA0A3B1),
                          size: 42,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Slider(
                    activeColor: Color(0xFF3F414E),
                    inactiveColor: Color(0xFFBABCC6),
                    value: 2,
                    min: 0,
                    max: 10,
                    onChanged: (value) {},
                  ),

                  Row(
                    children: [
                      Text(
                        '01:30',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F414E),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '15:00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3F414E),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
