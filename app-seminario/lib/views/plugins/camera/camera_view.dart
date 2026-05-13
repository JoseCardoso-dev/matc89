import 'dart:io';

import 'package:app_seminario/views/plugins/camera/camera_controller.dart';
import 'package:app_seminario/views/plugins/camera/widgets/image_view_item_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final CameraViewController _controller = CameraViewController();

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: _controller.isLoading,
        builder: (_, isLoading, _) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black12),
            );
          }

          return SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(_controller.cameraController!),
                ),
                Positioned(
                  bottom: 160,
                  left: MediaQuery.of(context).size.width / 2 - 35,
                  child: GestureDetector(
                    onTap: _controller.takePicture,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 48,
                  right: 12,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 16,
                  child: ValueListenableBuilder<List<File>>(
                    valueListenable: _controller.images,
                    builder: (_, images, _) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (_, index) {
                            final file = images[index];

                            return ImageViewItemWidget(
                              pathImage: file.path,
                              onTapFunction: () =>
                                  _controller.removeImage(file),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
