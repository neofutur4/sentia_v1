import 'package:flutter/material.dart';
import 'package:sentia/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://hzysdmldvpryzswzpepj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6eXNkbWxkdnByeXpzd3pwZXBqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU1MDgwMzAsImV4cCI6MjA4MTA4NDAzMH0.3E_p8eNKiyh4v4pgF3U7XBWJaempwZv03tEewGDCuag',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
