import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewItemWidget extends StatelessWidget {
  final String pathImage;
  final void Function()? onTapFunction;

  const ImageViewItemWidget({
    super.key,
    this.onTapFunction,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(6),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(File(pathImage), fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTapFunction,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
