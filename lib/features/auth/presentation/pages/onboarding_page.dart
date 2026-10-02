import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PROOF',
                    style: TextStyle(
                      color: Color(0xFF123B32),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    '01',
                    style: TextStyle(
                      color: const Color(0xFF123B32).withValues(alpha: 0.45),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Illustration
              const Center(
                child: _PhoneIllustration(),
              ),

              const SizedBox(height: 28),

              // Petit indicateur
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF2FA66A),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              // Titre
              const Text(
                'Enregistrez votre terrain\n'
                'en toute sécurité.',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  height: 1.14,
                  letterSpacing: -0.7,
                ),
              ),

              const SizedBox(height: 14),

              // Description
              const Text(
                'Ajoutez les informations de votre terrain, '
                'vos documents et suivez son historique '
                'de propriété.',
                style: TextStyle(
                  color: Color(0xFF6B7470),
                  fontSize: 15,
                  height: 1.55,
                ),
              ),

              const SizedBox(height: 24),

              // Indicateurs
              Row(
                children: [
                  _Indicator(active: true),
                  _Indicator(active: false),
                  _Indicator(active: false),
                ],
              ),

              const SizedBox(height: 20),

              // Bouton Suivant
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123B32),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Suivant',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Passer
              Center(
                child: TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text(
                    'Passer',
                    style: TextStyle(
                      color: Color(0xFF6B7470),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
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

// -----------------------------------------------------------------------------
// INDICATEURS
// -----------------------------------------------------------------------------

class _Indicator extends StatelessWidget {
  final bool active;

  const _Indicator({
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 26 : 7,
      height: 7,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF2FA66A)
            : const Color(0xFFD5DCD8),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// ILLUSTRATION DU TÉLÉPHONE
// -----------------------------------------------------------------------------

class _PhoneIllustration extends StatelessWidget {
  const _PhoneIllustration();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5EF),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Center(
        child: Container(
          width: 150,
          height: 270,
          decoration: BoxDecoration(
            color: const Color(0xFF17211E),
            borderRadius: BorderRadius.circular(27),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                blurRadius: 30,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F6),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const SizedBox(height: 13),

                // Haut du téléphone
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF17211E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),

                // Carte
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _MiniMapPainter(),
                        ),
                      ),

                      // Localisation
                      Positioned(
                        top: 55,
                        left: 55,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2FA66A),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 5,
                            ),
                          ),
                        ),
                      ),

                      // Utilisateur
                      Positioned(
                        bottom: 28,
                        right: 16,
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.10),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            color: Color(0xFF123B32),
                            size: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// MINI CARTE
// -----------------------------------------------------------------------------

class _MiniMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFFD5DDD8)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final roadPaint = Paint()
      ..color = const Color(0xFFE1CFA8)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Lignes de parcelles
    for (double x = 0; x < size.width; x += 35) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x - 25, size.height),
        linePaint,
      );
    }

    for (double y = 20; y < size.height; y += 42) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y - 15),
        linePaint,
      );
    }

    // Route
    final road = Path()
      ..moveTo(0, size.height * 0.72)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.55,
        size.width,
        size.height * 0.62,
      );

    canvas.drawPath(road, roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}