import 'package:app_lua_mobile/app/modules/login/view/widgets/lua_input_widget.dart';
import 'package:app_lua_mobile/app/modules/objective/view/objective_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final vm = LoginViewModel();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SvgPicture.asset('assets/login/part_view_one.svg'),

            Column(
              spacing: 8,
              children: [
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(),
                ),

                const SizedBox(height: 20),

                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'BEM VINDO DE VOLTA!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 374,
                  height: 63,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7583CA),
                      foregroundColor: const Color(0xFFF6F1FB),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/login/icon_view_two.svg',
                          ),
                        ),
                        Spacer(),
                        const Text(
                          'CONTINUE COM FACEBOOK',
                          style: TextStyle(
                            fontFamily: 'Alexandria',
                            fontSize: 14,
                            letterSpacing: 0.7,
                            height: 15 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 374,
                  height: 63,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Color(0xFFEBEAEC),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/login/icon_view_one.svg',
                          ),
                        ),
                        Spacer(),
                        const Text(
                          'CONTINUE COM GOOGLE',
                          style: TextStyle(
                            fontFamily: 'Alexandria',
                            fontSize: 14,
                            color: Color(0xFF3F414E),
                            letterSpacing: 0.7,
                            height: 15 / 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'OU FAÇA LOGIN COM SEU E-MAIL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xffA1A4B2),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _emailController,
                        hint: 'Email address',
                      ),

                      const SizedBox(height: 12),

                      AppTextField(
                        controller: _passwordController,
                        hint: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 18),

                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: SizedBox(
                          width: double.infinity,
                          height: 63,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (context) => ObjectiveView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF8E97FD),
                              foregroundColor: const Color(0xFFF6F1FB),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31.5),
                              ),
                            ),
                            child: const Text('ENTRAR'),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu sua senha?',
                          style: TextStyle(
                            fontFamily: 'Alexandria',
                            fontSize: 14,
                            color: Color(0xFF3F414E),
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Text.rich(
                          TextSpan(
                            text: 'JÁ POSSUI UMA CONTA? ',
                            style: const TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize: 14,
                              color: Color(0xFFA1A4B2),
                              letterSpacing: 0.7,
                            ),
                            children: [
                              TextSpan(
                                text: 'ENTRAR',
                                style: TextStyle(
                                  color: Color(0xFF8E97FD),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
