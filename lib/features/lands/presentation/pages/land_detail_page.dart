import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandDetailPage extends StatelessWidget {
  const LandDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/verification'),
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
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terrain résidentiel',
                      style: TextStyle(
                        color: Color(0xFF17211E),
                        fontSize: 17,
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
                  'Disponible',
                  style: TextStyle(
                    color: Color(0xFF238452),
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
          value: 'Résidentiel',
        ),
        _buildInfoRow(
          icon: Icons.square_foot_outlined,
          label: 'Superficie',
          value: '500 m²',
        ),
        _buildInfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Date d’enregistrement',
          value: '12 septembre 2026',
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
          value: 'Localisation enregistrée',
        ),
        _buildInfoRow(
          icon: Icons.explore_outlined,
          label: 'Latitude',
          value: '0.3901',
        ),
        _buildInfoRow(
          icon: Icons.explore_outlined,
          label: 'Longitude',
          value: '9.4544',
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
          value: 'Propriétaire enregistré',
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
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
           context.go('/land-history');
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
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF123B32),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}