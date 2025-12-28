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
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0), // Increased vertical padding
              child: SingleChildScrollView(
                child: Text(
                  story['content']?.replaceAll('\\n', '\n\n') ?? 'Contenido no disponible.',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20.0, // Increased font size
                    color: Color(0xFFE0E0E0), // Lighter gray
                    height: 1.8,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
             Positioned(
              top: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement settings modal
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
