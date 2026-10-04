import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF123B32),
      body: Stack(
        children: [
          const Positioned.fill(
            child: _LandBackground(),
          ),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.45, 1.0],
                  colors: [
                    Color(0xCC123B32),
                    Color(0x66123B32),
                    Color(0xF2123B32),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ProofBrand(
                    light: true,
                  ),

                  const Spacer(),

                  const Text(
                    'Vérification et traçabilité\n'
                    'de la propriété foncière.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                      letterSpacing: -0.8,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    'Une preuve numérique pour chaque terrain, '
                    'une histoire claire pour chaque propriété.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.78),
                      fontSize: 15,
                      height: 1.55,
                    ),
                  ),

                  const SizedBox(height: 34),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.09),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2FA66A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.verified_outlined,
                            color: Colors.white,
                            size: 21,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Text(
                            'Plus de transparence pour un foncier sécurisé',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.92),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              height: 1.35,
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
        ],
      ),
    );
  }
}

class _ProofBrand extends StatelessWidget {
  final bool light;

  const _ProofBrand({
    required this.light,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = light ? Colors.white : const Color(0xFF123B32);

    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFF2FA66A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'PROOF',
          style: TextStyle(
            color: textColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.5,
          ),
        ),
      ],
    );
  }
}

class _LandBackground extends StatelessWidget {
  const _LandBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LandPainter(),
    );
  }
}

class _LandPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color(0xFF526B4F);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );

    paint.color = const Color(0xFF6F805D);

    final parcels = [
      Rect.fromLTWH(
        -40,
        size.height * 0.28,
        size.width * 0.48,
        size.height * 0.22,
      ),
      Rect.fromLTWH(
        size.width * 0.40,
        size.height * 0.20,
        size.width * 0.65,
        size.height * 0.25,
      ),
      Rect.fromLTWH(
        -20,
        size.height * 0.53,
        size.width * 0.38,
        size.height * 0.26,
      ),
      Rect.fromLTWH(
        size.width * 0.35,
        size.height * 0.48,
        size.width * 0.72,
        size.height * 0.30,
      ),
    ];

    for (final parcel in parcels) {
      canvas.drawRect(parcel, paint);
    }

    paint
      ..color = const Color(0x55E5C98F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (final parcel in parcels) {
      canvas.drawRect(parcel, paint);
    }

    paint.style = PaintingStyle.fill;

    final roadPaint = Paint()
      ..color = const Color(0x448F7652)
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final road = Path()
      ..moveTo(0, size.height * 0.72)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.61,
        size.width,
        size.height * 0.68,
      );

    canvas.drawPath(road, roadPaint);

    paint.color = const Color(0xFF2FA66A);

    canvas.drawCircle(
      Offset(size.width * 0.68, size.height * 0.44),
      9,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}