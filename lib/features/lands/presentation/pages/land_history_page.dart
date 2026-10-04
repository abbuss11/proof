import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _Owner {
  final String name;
  final String period;
  final String status;
  final bool current;

  const _Owner({
    required this.name,
    required this.period,
    required this.status,
    required this.current,
  });
}

class LandHistoryPage extends StatelessWidget {
  final String landId;

  const LandHistoryPage({
    super.key,
    required this.landId,
  });

  static const Map<String, List<_Owner>> _histories = {
    'LAND-001': [
      _Owner(
        name: 'Jean Dupont',
        period: 'Depuis le 20 septembre 2026',
        status: 'Propriétaire actuel',
        current: true,
      ),
      _Owner(
        name: 'Marie Martin',
        period: '12 juin 2024 — 20 septembre 2026',
        status: 'Ancien propriétaire',
        current: false,
      ),
      _Owner(
        name: 'Paul Kabeya',
        period: '03 mars 2021 — 12 juin 2024',
        status: 'Ancien propriétaire',
        current: false,
      ),
    ],
    'LAND-002': [
      _Owner(
        name: 'Alain Martin',
        period: 'Depuis le 15 septembre 2026',
        status: 'Propriétaire actuel',
        current: true,
      ),
      _Owner(
        name: 'Sophie Bernard',
        period: '08 janvier 2023 — 15 septembre 2026',
        status: 'Ancien propriétaire',
        current: false,
      ),
    ],
    'LAND-003': [
      _Owner(
        name: 'David Kanku',
        period: 'Depuis le 10 février 2025',
        status: 'Propriétaire actuel',
        current: true,
      ),
      _Owner(
        name: 'Grace Ilunga',
        period: '14 mai 2021 — 10 février 2025',
        status: 'Ancien propriétaire',
        current: false,
      ),
      _Owner(
        name: 'Michel Tshisekedi',
        period: '02 janvier 2018 — 14 mai 2021',
        status: 'Ancien propriétaire',
        current: false,
      ),
    ],
  };

  static const Map<String, String> _landNames = {
    'LAND-001': 'Terrain résidentiel',
    'LAND-002': 'Terrain commercial',
    'LAND-003': 'Terrain familial',
  };

  List<_Owner> get _owners =>
      _histories[landId] ?? _histories['LAND-001']!;

  String get _landName =>
      _landNames[landId] ?? 'Terrain résidentiel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(
            '/land-detail',
            extra: landId,
          ),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _landName,
                  style: const TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  landId,
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
      children: List.generate(
        _owners.length,
        (index) {
          final owner = _owners[index];

          return _buildOwnerItem(
            owner: owner,
            isFirst: index == 0,
            isLast: index == _owners.length - 1,
          );
        },
      ),
    );
  }

  Widget _buildOwnerItem({
    required _Owner owner,
    required bool isFirst,
    required bool isLast,
  }) {
    final statusColor = owner.current
        ? const Color(0xFF238452)
        : const Color(0xFF6B7470);

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
                    owner.current
                        ? Icons.person
                        : Icons.person_outline,
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
                      owner.status,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      owner.name,
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
                            owner.period,
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