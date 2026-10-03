import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: const Color(0xFFE8ECE8),
                child: CustomPaint(
                  painter: _MapBackgroundPainter(),
                ),
              ),
            ),

            Positioned(
              top: 16,
              left: 20,
              right: 20,
              child: _buildHeader(context),
            ),

            Positioned(
              top: 78,
              left: 20,
              right: 20,
              child: _buildSearch(),
            ),

            Positioned(
              bottom: 28,
              left: 20,
              child: _buildLegend(),
            ),

            Positioned(
              right: 20,
              bottom: 28,
              child: _buildLocationButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
            size: 21,
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Text(
            'Carte des terrains',
            style: TextStyle(
              color: Color(0xFF17211E),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ],
  );
}

  Widget _buildSearch() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Color(0xFF6B7470),
            size: 21,
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Text(
              'Rechercher un terrain',
              style: TextStyle(
                color: Color(0xFF8A938F),
                fontSize: 13,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 11,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text(
              'Tous',
              style: TextStyle(
                color: Color(0xFF238452),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Row(
        children: [
          _LegendItem(
            color: Color(0xFF2FA66A),
            label: 'Disponible',
          ),
          SizedBox(width: 14),
          _LegendItem(
            color: Color(0xFFE5A23C),
            label: 'En transfert',
          ),
          SizedBox(width: 14),
          _LegendItem(
            color: Color(0xFFD94B4B),
            label: 'En litige',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF123B32),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const Icon(
        Icons.my_location,
        color: Colors.white,
        size: 21,
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF59635F),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _MapBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFD3D8D3)
      ..strokeWidth = 13
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final secondaryRoadPaint = Paint()
      ..color = const Color(0xFFE0E4E0)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final parcelPaint = Paint()
      ..color = const Color(0x332FA66A)
      ..style = PaintingStyle.fill;

    final parcelBorder = Paint()
      ..color = const Color(0x662FA66A)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    final mainRoad = Path()
      ..moveTo(-30, size.height * 0.30)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.40,
        size.width + 30,
        size.height * 0.25,
      );

    canvas.drawPath(mainRoad, roadPaint);

    final secondaryRoad = Path()
      ..moveTo(size.width * 0.10, size.height + 20)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.65,
        size.width * 0.78,
        -20,
      );

    canvas.drawPath(secondaryRoad, secondaryRoadPaint);

    final parcels = [
      Rect.fromLTWH(
        size.width * 0.05,
        size.height * 0.45,
        size.width * 0.23,
        size.height * 0.15,
      ),
      Rect.fromLTWH(
        size.width * 0.31,
        size.height * 0.48,
        size.width * 0.19,
        size.height * 0.13,
      ),
      Rect.fromLTWH(
        size.width * 0.56,
        size.height * 0.40,
        size.width * 0.25,
        size.height * 0.17,
      ),
      Rect.fromLTWH(
        size.width * 0.13,
        size.height * 0.67,
        size.width * 0.25,
        size.height * 0.16,
      ),
      Rect.fromLTWH(
        size.width * 0.48,
        size.height * 0.63,
        size.width * 0.22,
        size.height * 0.15,
      ),
    ];

    for (final parcel in parcels) {
      canvas.drawRect(parcel, parcelPaint);
      canvas.drawRect(parcel, parcelBorder);
    }

    final markers = [
      Offset(size.width * 0.22, size.height * 0.52),
      Offset(size.width * 0.64, size.height * 0.47),
      Offset(size.width * 0.58, size.height * 0.70),
    ];

    final markerColors = [
      const Color(0xFF2FA66A),
      const Color(0xFFE5A23C),
      const Color(0xFFD94B4B),
    ];

    for (var i = 0; i < markers.length; i++) {
      canvas.drawCircle(
        markers[i],
        9,
        Paint()..color = Colors.white,
      );

      canvas.drawCircle(
        markers[i],
        6,
        Paint()..color = markerColors[i],
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}