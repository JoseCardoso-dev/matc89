import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraViewController {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final ValueNotifier<List<File>> images = ValueNotifier<List<File>>([]);

  CameraController? _cameraController;
  bool _isCapturing = false;

  CameraController? get cameraController => _cameraController;

  Future<void> initialize() async {
    try {
      isLoading.value = true;

      final cameras = await availableCameras();

      if (cameras.isEmpty) return;

      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );

      await _cameraController!.initialize();
    } catch (e) {
      debugPrint("Erro ao inicializar câmera: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> takePicture() async {
    if (_cameraController == null ||
        !_cameraController!.value.isInitialized ||
        _isCapturing) {
      return;
    }

    _isCapturing = true;

    try {
      final image = await _cameraController!.takePicture();

      images.value = List<File>.from(images.value)..add(File(image.path));
    } finally {
      _isCapturing = false;
    }
  }

  Future<void> removeImage(File file) async {
    if (await file.exists()) {
      await file.delete();
    }

    images.value = List<File>.from(images.value)..remove(file);
  }

  Future<void> clear() async {
    for (final file in images.value) {
      if (await file.exists()) {
        await file.delete();
      }
    }

    images.value = [];
  }

  void dispose() {
    _cameraController?.dispose();
    isLoading.dispose();
    images.dispose();
  }
}
