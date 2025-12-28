import 'package:flutter/material.dart';
import 'package:sentia/ui/home_screen.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A3E52), // Azul petróleo
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Crea un hábito de lectura',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pensado para leer en familia',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 32),
              _buildPlanOption(
                title: 'Plan Anual',
                price: '\$19.99/año',
                subtitle: 'Prueba 3 días gratis, luego \$19.99/año',
                isSelected: true,
              ),
              const SizedBox(height: 16),
              _buildPlanOption(
                title: 'Plan Mensual',
                price: '\$2.99/mes',
                subtitle: '3 días gratis, luego facturado mensualmente',
                isSelected: false,
              ),
              const SizedBox(height: 32),
              _buildFeaturesList(),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement purchase logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA57BEF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Comenzar Prueba Gratuita', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                child: Text(
                  'Continuar con versión gratuita',
                  style: TextStyle(
                    color: Colors.grey[300],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItem(icon: Icons.check_circle, text: 'Acceso completo a la biblioteca Premium'),
        const SizedBox(height: 12),
        _buildFeatureItem(icon: Icons.check_circle, text: 'Modo offline para viajes'),
        const SizedBox(height: 12),
        _buildFeatureItem(icon: Icons.check_circle, text: 'Actividades y PDFs imprimibles'),
      ],
    );
  }

  Widget _buildFeatureItem({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String price,
    required String subtitle,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF344C64),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFFA57BEF) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA57BEF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFFA57BEF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 16),
            )
          else
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }
}
