import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonActionWidget extends StatelessWidget {
  final String iconPath;
  final bool isBorderActive;
  final Color backgroundColor;
  final Color iconColor;

  const ButtonActionWidget({
    super.key,
    required this.iconPath,
    required this.isBorderActive,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(999),
          border: isBorderActive
              ? Border.all(color: Color(0xFFEBEAEC), width: 1)
              : null,
        ),
        padding: const EdgeInsets.all(18),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
