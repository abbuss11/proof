import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandHistoryPage extends StatelessWidget {
  const LandHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/land-detail'),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Historique des propriétaires',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _buildLandHeader(),
          const SizedBox(height: 28),

          const Text(
            'Historique de propriété',
            style: TextStyle(
              color: Color(0xFF17211E),
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Consultez les différents propriétaires enregistrés pour ce terrain.',
            style: TextStyle(
              color: Color(0xFF6B7470),
              fontSize: 12,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          _buildOwnerTimeline(),
        ],
      ),
    );
  }

  Widget _buildLandHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.landscape_outlined,
              color: Color(0xFF238452),
              size: 26,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrain résidentiel',
                  style: TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'LAND-001',
                  style: TextStyle(
                    color: Color(0xFF8A938F),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Text(
              'Vérifié',
              style: TextStyle(
                color: Color(0xFF238452),
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerTimeline() {
    return Column(
      children: [
        _buildOwnerItem(
          name: 'Souveraine Mab',
          period: 'Depuis le 20 septembre 2026',
          status: 'Propriétaire actuel',
          statusColor: const Color(0xFF238452),
          icon: Icons.person,
          isFirst: true,
          isLast: false,
        ),

        _buildOwnerItem(
          name: 'Marie Martin',
          period: '12 juin 2024 — 20 septembre 2026',
          status: 'Ancien propriétaire',
          statusColor: const Color(0xFF6B7470),
          icon: Icons.person_outline,
          isFirst: false,
          isLast: false,
        ),

        _buildOwnerItem(
          name: 'Divin Mab',
          period: '03 mars 2021 — 12 juin 2024',
          status: 'Ancien propriétaire',
          statusColor: const Color(0xFF6B7470),
          icon: Icons.person_outline,
          isFirst: false,
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildOwnerItem({
    required String name,
    required String period,
    required String status,
    required Color statusColor,
    required IconData icon,
    required bool isFirst,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: statusColor,
                    size: 19,
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      color: const Color(0xFFDCE2DE),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: isLast ? 0 : 22,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF17211E),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xFF8A938F),
                          size: 15,
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Text(
                            period,
                            style: const TextStyle(
                              color: Color(0xFF6B7470),
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}