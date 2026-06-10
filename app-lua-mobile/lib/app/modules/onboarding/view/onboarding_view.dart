import 'package:flutter/material.dart';

import '../view_model/onboarding_view_model.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final vm = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Stack(
              children: [
                  Positioned.fill(
                  
                      child: SvgPicture.asset(
                        'assets/onboarding/part_view_two.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                Positioned(
                  bottom: 120,
                  right: 20,
                  child: SvgPicture.asset(
                    'assets/onboarding/part_view_one.svg',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                 Text(
                  'Somos o que\n fazemos.',
                  textAlign: TextAlign.center,
                  
                  style: const TextStyle(
                    fontFamily: 'Alexandria',
                    fontSize: 32,
                    color: Color(0xFF3F414E),
                    height: 43 / 32,
                    fontWeight: FontWeight(700)
            
                  ),
                ),
                Text(
                    'Milhares de pessoas estão usando a Lua\npara pequenas meditações',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 16,
                      color: Color(0xFFA1A4B2),
                      height: 26 / 16, // line-height
                    ),
                  )
              ],
            ),
          ),       

          Spacer(),
          SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8E97FD),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
                child: const Text(
                  'COMEÇAR',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Text.rich(
            TextSpan(
              text: 'Já possui uma conta? ',
              style: const TextStyle(
                fontFamily: 'Alexandria',
                fontSize: 14,
                color: Color(0xFFA1A4B2),
              ),
              children: [
                TextSpan(
                  text: 'CRIAR',
                  style: TextStyle(
                    color: Color(0xFF8E97FD),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Spacer()
        ],
      ),
    ),
    );

  }
}
