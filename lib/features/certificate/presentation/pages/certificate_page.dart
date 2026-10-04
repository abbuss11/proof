import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CertificatePage extends StatelessWidget {
  final String landId;

  const CertificatePage({
    super.key,
    required this.landId,
  });

  String get _landTitle {
    switch (landId) {
      case 'LAND-002':
        return 'Terrain commercial';
      case 'LAND-003':
        return 'Terrain familial';
      default:
        return 'Terrain résidentiel';
    }
  }

  String get _landArea {
    switch (landId) {
      case 'LAND-002':
        return '800 m²';
      case 'LAND-003':
        return '650 m²';
      default:
        return '500 m²';
    }
  }

  String get _ownerName {
    switch (landId) {
      case 'LAND-002':
        return 'Alain Martin';
      case 'LAND-003':
        return 'Sophie Bernard';
      default:
        return 'Alain Martin';
    }
  }

  String get _certificateId {
    switch (landId) {
      case 'LAND-002':
        return 'CERT-2026-002';
      case 'LAND-003':
        return 'CERT-2026-003';
      default:
        return 'CERT-2026-001';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(
            '/transfer',
            extra: landId,
          ),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Certificat numérique',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _buildVerificationHeader(),
          const SizedBox(height: 18),
          _buildCertificateCard(),
          const SizedBox(height: 18),
          _buildActions(context),
          const SizedBox(height: 18),
          _buildInfoCard(),
        ],
      ),
    );
  }

  Widget _buildVerificationHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5EF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.verified_outlined,
            color: Color(0xFF2FA66A),
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certificat vérifié',
                  style: TextStyle(
                    color: Color(0xFF123B32),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Ce certificat est associé à un terrain enregistré dans PROOF.',
                  style: TextStyle(
                    color: Color(0xFF5F716A),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFDCE5DF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.account_balance_outlined,
            color: Color(0xFF2FA66A),
            size: 30,
          ),
          const SizedBox(height: 10),
          const Text(
            'PROOF',
            style: TextStyle(
              color: Color(0xFF123B32),
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'CERTIFICAT NUMÉRIQUE DE PROPRIÉTÉ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF6B7470),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            width: 110,
            height: 110,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F6),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFE1E7E3),
              ),
            ),
            child: const Icon(
              Icons.qr_code_2,
              color: Color(0xFF17211E),
              size: 82,
            ),
          ),
          const SizedBox(height: 20),
          _buildCertificateRow(
            'Terrain',
            _landTitle,
          ),
          _buildCertificateRow(
            'Référence',
            landId,
          ),
          _buildCertificateRow(
            'Superficie',
            _landArea,
          ),
          _buildCertificateRow(
            'Propriétaire',
            _ownerName,
          ),
          _buildCertificateRow(
            'Date d’émission',
            '03 octobre 2026',
          ),
          _buildCertificateRow(
            'Identifiant',
            _certificateId,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified,
                  color: Color(0xFF2FA66A),
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'Propriété enregistrée',
                  style: TextStyle(
                    color: Color(0xFF267C51),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 105,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF8A938F),
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF17211E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              _showMessage(
                context,
                'Le téléchargement sera disponible prochainement.',
              );
            },
            icon: const Icon(
              Icons.download_outlined,
              size: 19,
            ),
            label: const Text('Télécharger'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF123B32),
              side: const BorderSide(
                color: Color(0xFF2FA66A),
              ),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              _showMessage(
                context,
                'Le partage sera disponible prochainement.',
              );
            },
            icon: const Icon(
              Icons.share_outlined,
              size: 19,
            ),
            label: const Text('Partager'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2FA66A),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF6B7470),
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Le certificat numérique permet de consulter les informations essentielles du terrain et de vérifier son enregistrement dans PROOF.',
              style: TextStyle(
                color: Color(0xFF6B7470),
                fontSize: 11,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}