import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLandsPage extends StatelessWidget {
  const MyLandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Mes terrains',
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
          const Text(
            'Vos terrains',
            style: TextStyle(
              color: Color(0xFF17211E),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Retrouvez ici les terrains associés à votre compte.',
            style: TextStyle(
              color: Color(0xFF6B7470),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          _buildLandCard(
            title: 'Terrain résidentiel',
            reference: 'LAND-001',
            location: 'Localisation enregistrée',
            status: 'Disponible',
            statusColor: const Color(0xFF2FA66A),
            statusBackground: const Color(0xFFEAF5EF),
            onTap: () {
              context.go('/land-detail', extra: 'LAND-001');
            },
          ),

          const SizedBox(height: 14),

          _buildLandCard(
            title: 'Terrain commercial',
            reference: 'LAND-002',
            location: 'Localisation enregistrée',
            status: 'En transfert',
            statusColor: const Color(0xFFE5A23C),
            statusBackground: const Color(0xFFFFF4E2),
            onTap: () {
              context.go('/land-detail', extra: 'LAND-002');
            },
          ),

          const SizedBox(height: 14),

          _buildLandCard(
            title: 'Terrain familial',
            reference: 'LAND-003',
            location: 'Localisation enregistrée',
            status: 'En litige',
            statusColor: const Color(0xFFD94B4B),
            statusBackground: const Color(0xFFFFEAEA),
            onTap: () {
              context.go('/land-detail', extra: 'LAND-003');
            },
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 52,
            child: OutlinedButton.icon(
              onPressed: () {
                context.go('/register-land');
              },
              icon: const Icon(
                Icons.add,
                size: 20,
              ),
              label: const Text(
                'Enregistrer un terrain',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF123B32),
                side: const BorderSide(
                  color: Color(0xFF123B32),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandCard({
    required String title,
    required String reference,
    required String location,
    required String status,
    required Color statusColor,
    required Color statusBackground,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF5EF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.landscape_outlined,
                      color: Color(0xFF238452),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF17211E),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          reference,
                          style: const TextStyle(
                            color: Color(0xFF8A938F),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const Divider(
                height: 1,
                color: Color(0xFFE8ECE8),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF6B7470),
                    size: 17,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xFF6B7470),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}