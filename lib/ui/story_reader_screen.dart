import 'package:flutter/material.dart';

class StoryReaderScreen extends StatelessWidget {
  final Map<String, dynamic> story;

  const StoryReaderScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Very dark charcoal/black
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
              child: SingleChildScrollView(
                child: Text(
                  story['content'] ?? 'Contenido no disponible.',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                    height: 1.8,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
             Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  // TODO: Implement settings modal
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
