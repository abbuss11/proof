
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _referenceController = TextEditingController();

  int _selectedMethod = 0;

  @override
  void dispose() {
    _referenceController.dispose();
    super.dispose();
  }

  void _verifyLand() {
    final reference = _referenceController.text.trim().toUpperCase();

    if (reference.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez saisir la référence du terrain.',
          ),
        ),
      );
      return;
    }

    const validReferences = {
      'LAND-001',
      'LAND-002',
      'LAND-003',
    };

    if (!validReferences.contains(reference)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Aucun terrain trouvé avec cette référence.',
          ),
        ),
      );
      return;
    }

    context.go(
      '/land-detail',
      extra: reference,
    );
  }

 void _openScanner() {
  context.go('/qr-scanner');
}

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
          'Vérifier un terrain',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          _buildIntro(),
          const SizedBox(height: 28),
          _buildMethodSelector(),
          const SizedBox(height: 24),
          if (_selectedMethod == 0)
            _buildReferenceForm()
          else
            _buildQrSection(),
        ],
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5EF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.verified_outlined,
              color: Color(0xFF238452),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vérification foncière',
                  style: TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Vérifiez les informations disponibles sur un terrain avant une transaction.',
                  style: TextStyle(
                    color: Color(0xFF527067),
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodSelector() {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8ECE8),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildMethodButton(
              index: 0,
              icon: Icons.search,
              label: 'Identifiant',
            ),
          ),
          Expanded(
            child: _buildMethodButton(
              index: 1,
              icon: Icons.qr_code_scanner,
              label: 'QR code',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodButton({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _selectedMethod == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected
                  ? const Color(0xFF123B32)
                  : const Color(0xFF6B7470),
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF123B32)
                    : const Color(0xFF6B7470),
                fontSize: 12,
                fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReferenceForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rechercher par identifiant',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Saisissez la référence figurant sur le document du terrain.',
          style: TextStyle(
            color: Color(0xFF6B7470),
            fontSize: 12,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Référence du terrain',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _referenceController,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            hintText: 'Ex. LAND-001',
            prefixIcon: const Icon(
              Icons.tag_outlined,
              color: Color(0xFF6B7470),
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              color: Color(0xFF9AA29E),
              fontSize: 13,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Color(0xFF2FA66A),
                width: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: _verifyLand,
            icon: const Icon(
              Icons.search,
              size: 19,
            ),
            label: const Text(
              'Vérifier le terrain',
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
        ),
      ],
    );
  }

  Widget _buildQrSection() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
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
            children: [
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5EF),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  color: Color(0xFF238452),
                  size: 42,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Scanner le QR code',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Scannez le QR code présent sur le certificat du terrain pour accéder à ses informations.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B7470),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: _openScanner,
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 19,
                  ),
                  label: const Text(
                    'Ouvrir le scanner',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
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
        ),
      ],
    );
  }
}
