import 'package:app_seminario/views/packages/loading_animation_view.dart';
import 'package:app_seminario/views/packages/shimmer_view.dart';
import 'package:app_seminario/views/plugins/audio_view.dart';
import 'package:app_seminario/views/plugins/camera/camera_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'Demonstração - MATC89',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
          children: [
            _HomeCard(
              title: 'Audio Player',
              icon: Icons.music_note,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AudioView()),
              ),
            ),
            _HomeCard(
              title: 'Câmera',
              icon: Icons.camera_alt,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CameraView()),
              ),
            ),
            _HomeCard(
              title: 'Loading Animation',
              icon: Icons.hourglass_bottom,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoadingAnimationView()),
              ),
            ),
            _HomeCard(
              title: 'Shimmer',
              icon: Icons.blur_on,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ShimmerView()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
