import 'package:flutter/material.dart';

class StoryReaderScreen extends StatefulWidget {
  final Map<String, dynamic> story;

  const StoryReaderScreen({super.key, required this.story});

  @override
  State<StoryReaderScreen> createState() => _StoryReaderScreenState();
}

class _StoryReaderScreenState extends State<StoryReaderScreen> {
  double _fontSize = 20.0;
  bool _isDarkMode = true;

  void _showSettingsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(24.0),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Configuración de lectura',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tamaño de fuente',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: _isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                      Text(
                        '${_fontSize.round()} px',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: _isDarkMode ? Colors.white54 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: _fontSize,
                    min: 14.0,
                    max: 32.0,
                    divisions: 9,
                    activeColor: const Color(0xFF6B4EFF), // A purple accent
                    onChanged: (value) {
                      setModalState(() {
                        _fontSize = value;
                      });
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Modo oscuro',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: _isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                      Switch(
                        value: _isDarkMode,
                        activeColor: const Color(0xFF6B4EFF),
                        onChanged: (value) {
                          setModalState(() {
                            _isDarkMode = value;
                          });
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.story['content']?.replaceAll('\\n', '\n\n') ?? 'Contenido no disponible.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: _fontSize,
                    color: _isDarkMode ? const Color(0xFFE0E0E0) : const Color(0xFF212121),
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
                    _showSettingsModal(context);
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
