import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sentia/ui/story_reader_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> _storiesFuture;

  @override
  void initState() {
    super.initState();
    _storiesFuture = _fetchStories();
  }

  Future<List<Map<String, dynamic>>> _fetchStories() async {
    final response = await Supabase.instance.client.from('stories').select();
    return (response as List).map((e) => e as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C3C3C), // Carbón
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C3C3C),
        elevation: 0,
        title: const Text(
          'Biblioteca Mágica',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar historias...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: const Color(0xFF2A3E52), // Azul petróleo
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterChips(),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _storiesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No se encontraron cuentos.', style: TextStyle(color: Colors.white)));
                }

                final stories = snapshot.data!;
                return GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => StoryReaderScreen(story: story),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                story['cover_image'] ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: const Color(0xFF2A3E52),
                                    child: const Icon(Icons.book, size: 48, color: Colors.white70),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            story['title'] ?? 'Sin título',
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildChip('Todos', isActive: true),
            _buildChip('Descargados'),
            _buildChip('Alegría'),
            _buildChip('Tristeza'),
            _buildChip('Ira'),
            _buildChip('Miedo'),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isActive ? const Color(0xFFA57BEF) : const Color(0xFF2A3E52),
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
