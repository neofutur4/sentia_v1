import 'package:flutter/material.dart';
import 'package:sentia/ui/home_screen.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A3E52),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sentia Premium',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Placeholder for premium features list
            const Text(
              'Desbloquea todas las historias y funciones.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement purchase logic
              },
              child: const Text('Comenzar Prueba Gratuita'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text(
                'Continuar con versión gratuita',
                style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
