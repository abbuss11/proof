import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _LandDetails {
  final String title;
  final String reference;
  final String status;
  final String type;
  final String area;
  final String registrationDate;
  final String address;
  final String latitude;
  final String longitude;
  final String owner;

  const _LandDetails({
    required this.title,
    required this.reference,
    required this.status,
    required this.type,
    required this.area,
    required this.registrationDate,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.owner,
  });
}

class LandDetailPage extends StatelessWidget {
  final String landId;

  const LandDetailPage({
    super.key,
    required this.landId,
  });

  static const Map<String, _LandDetails> _lands = {
    'LAND-001': _LandDetails(
      title: 'Terrain résidentiel',
      reference: 'LAND-001',
      status: 'Disponible',
      type: 'Résidentiel',
      area: '500 m²',
      registrationDate: '12 septembre 2026',
      address: 'Localisation enregistrée',
      latitude: '0.3901',
      longitude: '9.4544',
      owner: 'Propriétaire enregistré',
    ),
    'LAND-002': _LandDetails(
      title: 'Terrain commercial',
      reference: 'LAND-002',
      status: 'En transfert',
      type: 'Commercial',
      area: '800 m²',
      registrationDate: '18 août 2026',
      address: 'Localisation enregistrée',
      latitude: '0.3918',
      longitude: '9.4572',
      owner: 'Propriétaire enregistré',
    ),
    'LAND-003': _LandDetails(
      title: 'Terrain familial',
      reference: 'LAND-003',
      status: 'En litige',
      type: 'Familial',
      area: '650 m²',
      registrationDate: '03 mars 2025',
      address: 'Localisation enregistrée',
      latitude: '0.3884',
      longitude: '9.4518',
      owner: 'Propriétaire enregistré',
    ),
  };

  _LandDetails get _land =>
      _lands[landId] ?? _lands['LAND-001']!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/my-lands'),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Fiche du terrain',
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
          _buildHeader(),
          const SizedBox(height: 20),
          _buildInformationSection(),
          const SizedBox(height: 20),
          _buildLocationSection(),
          const SizedBox(height: 20),
          _buildOwnerSection(),
          const SizedBox(height: 24),
          _buildHistoryButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final statusColor = _getStatusColor();
    final statusBackground = _getStatusBackground();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5EF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.landscape_outlined,
                  color: Color(0xFF238452),
                  size: 27,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _land.title,
                      style: const TextStyle(
                        color: Color(0xFF17211E),
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _land.reference,
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
                  color: statusBackground,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  _land.status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(
            height: 1,
            color: Color(0xFFE8ECE8),
          ),
          const SizedBox(height: 16),
          const Text(
            'Terrain enregistré dans le registre foncier.',
            style: TextStyle(
              color: Color(0xFF6B7470),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationSection() {
    return _buildCard(
      title: 'Informations générales',
      children: [
        _buildInfoRow(
          icon: Icons.category_outlined,
          label: 'Type',
          value: _land.type,
        ),
        _buildInfoRow(
          icon: Icons.square_foot_outlined,
          label: 'Superficie',
          value: _land.area,
        ),
        _buildInfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Date d’enregistrement',
          value: _land.registrationDate,
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return _buildCard(
      title: 'Localisation',
      children: [
        _buildInfoRow(
          icon: Icons.location_on_outlined,
          label: 'Adresse',
          value: _land.address,
        ),
        _buildInfoRow(
          icon: Icons.explore_outlined,
          label: 'Latitude',
          value: _land.latitude,
        ),
        _buildInfoRow(
          icon: Icons.explore_outlined,
          label: 'Longitude',
          value: _land.longitude,
        ),
      ],
    );
  }

  Widget _buildOwnerSection() {
    return _buildCard(
      title: 'Propriétaire',
      children: [
        _buildInfoRow(
          icon: Icons.person_outline,
          label: 'Nom',
          value: _land.owner,
        ),
        _buildInfoRow(
          icon: Icons.verified_outlined,
          label: 'Statut',
          value: 'Propriétaire vérifié',
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF6B7470),
            size: 19,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF8A938F),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 52,
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              context.go(
                '/land-history',
                extra: landId,
              );
            },
            icon: const Icon(
              Icons.history,
              size: 19,
            ),
            label: const Text(
              'Voir l’historique',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 52,
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              context.go('/transfer');
            },
            icon: const Icon(
              Icons.swap_horiz_outlined,
              size: 20,
            ),
            label: const Text(
              'Transférer la propriété',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF123B32),
              side: const BorderSide(
                color: Color(0xFF2FA66A),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor() {
    switch (_land.status) {
      case 'En transfert':
        return const Color(0xFFE5A23C);
      case 'En litige':
        return const Color(0xFFD94B4B);
      default:
        return const Color(0xFF238452);
    }
  }

  Color _getStatusBackground() {
    switch (_land.status) {
      case 'En transfert':
        return const Color(0xFFFFF4E2);
      case 'En litige':
        return const Color(0xFFFFEAEA);
      default:
        return const Color(0xFFEAF5EF);
    }
  }
}