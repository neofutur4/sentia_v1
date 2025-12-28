import 'package:flutter/material.dart';
import 'package:sentia/paywall_screen.dart';
import 'package:sentia/ui/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // Determine background color based on the current page
    Color backgroundColor = const Color(0xFFE5E1F5); // Default background
    if (_currentPage >= 6) { // Pages 7 and 8 have a dark background
        backgroundColor = const Color(0xFF2A3E52);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
              OnboardingPage4(),
              OnboardingPage5(),
              OnboardingPage6(),
              OnboardingPage7(),
              OnboardingPage8(),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Atrás', style: TextStyle(color: _currentPage >= 6 ? Colors.white : const Color(0xFFA57BEF))),
                  )
                else
                  const SizedBox(width: 60), // Spacer
                Row(
                  children: List.generate(8, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index ? const Color(0xFFA57BEF) : Colors.grey,
                      ),
                    );
                  }),
                ),
                if (_currentPage < 7)
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Siguiente', style: TextStyle(color: _currentPage >= 6 ? Colors.white : const Color(0xFFA57BEF))),
                  )
                else
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const PaywallScreen()),
                      );
                    },
                    child: const Text('Finalizar', style: TextStyle(color: Color(0xFFA57BEF))),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Page 1: Ritual
class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBnDFGhBhgDu7_lkFABstXCb7M6ee3xHfBB53nJrmtBeuqtCfgprFkTZfQK_ZHX6MKdIA-8VfScpwoe0gaNi6nQwFBpK76Agnf9Pp37XT7CElQDCZvLFlQktD4j5owPTPGpdAg9Xg3VPjdp-HmAN8dYNivNmdEwXOccXqgar_KV2t4F9udt_-ohJYUUtjDA7i3gaIe022B-QqZuQeG64-aS2dfv-IgloKuo7LMVC3WMu7gSEmGh8SXkV58RpWj0i4MUXSnxzrjJHcr-',
                  fit: BoxFit.cover,
                  height: 350,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Un ritual antes de dormir',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Historias inmersivas para disfrutar en familia y hablar sobre lo que sienten.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 2: Noches tranquilas
class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.bedtime, size: 120, color: Color(0xFFA57BEF)),
              const SizedBox(height: 32),
              const Text(
                'Noches más tranquilas',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ayuda a tus hijos a desconectar y relajarse antes de dormir con una rutina mágica.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 3: Voz mágica
class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.mic, size: 120, color: Color(0xFFA57BEF)),
               const SizedBox(height: 32),
              const Text(
                'Tu voz activa la magia',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Una experiencia de lectura que cobra vida mientras narras tus cuentos favoritos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 4: Personalización
class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('Hagámoslo personal', style: TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
              const Text('Cuéntanos sobre tu peque', style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563))),
              const Spacer(),
              const TextField(decoration: InputDecoration(labelText: 'Nombre')),
              const SizedBox(height: 20),
              const Text('Edad'),
              // Placeholder for age selector
              const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('3'), Text('4'), Text('5'), Text('6'), Text('7'), Text('8+')]),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 5: Superpoder
class OnboardingPage5 extends StatelessWidget {
  const OnboardingPage5({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('¿Qué superpoder quieres entrenar hoy?', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
              const Text('Selecciona todos los que apliquen', style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563))),
              const Spacer(),
              // Placeholder for superpower grid
              const Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('Relajarse'), Text('Dormir')]),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('Valentía'), Text('Confianza')]),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 6: Permiso Micrófono
class OnboardingPage6 extends StatelessWidget {
  const OnboardingPage6({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.mic, size: 120, color: Color(0xFFA57BEF)),
              const SizedBox(height: 32),
              const Text('Para que la magia funcione...', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
              const SizedBox(height: 16),
              const Text('Necesitamos escucharte leer para lanzar los efectos de sonido.', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF4B5563))),
              const Spacer(),
              ElevatedButton(onPressed: () {}, child: const Text('Permitir Micrófono')),
              TextButton(onPressed: () {}, child: const Text('Continuar sin micrófono')),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 7: Login/Registro
class OnboardingPage7 extends StatelessWidget {
  const OnboardingPage7({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A3E52),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('Inicia sesión', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              const Text('Ingresa tu correo', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Colors.white70)),
              const Spacer(),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFFE5E1F5),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


// Page 8: Login
class OnboardingPage8 extends StatelessWidget {
  const OnboardingPage8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A3E52),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Spacer(),
              Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCCdQh_PugTeJZ97AD6YLpPv63LyfPWyx3rjbbmdirmsJs090BExw3IZ73nZrN1xB21jroRdRL_2ue7idBRLVQBOUoEoauri9Xty6iW8j_JlCTZVHus7039LWc_MrYom2dyIZUOrrKvnXvKi3YyJaOHbT4SMqwxzjYiUICKF8Jirs3rCo5inxasPKBV09Oy25fqh7fD9xhf0wbgY-ixhPDUV4hbTZa6ZNxl5QAbZDYEAcxexp0s9ucbJKKSfpnf3nhL2AW8BYrNVFTq',
                height: 250,
              ),
              const SizedBox(height: 40),
              const Text(
                'Comienza tu\naventura de lectura',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elige cómo quieres continuar',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA57BEF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Continuar como Invitado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
               Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Al registrarte, aceptas nuestros Términos de Servicio y Política de Privacidad.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
